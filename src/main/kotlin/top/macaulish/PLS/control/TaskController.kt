package top.macaulish.PLS.control

import com.macaulish.top.coconut.util.DateKits
import com.macaulish.top.coconut.util.FileKits
import org.apache.commons.io.FileUtils
import org.json.JSONArray
import org.json.JSONObject
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Value
import org.springframework.http.*
import org.springframework.stereotype.Controller
import org.springframework.util.FileCopyUtils
import org.springframework.web.bind.annotation.*
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.servlet.ModelAndView
import top.macaulish.PLS.dao.TaskDao
import top.macaulish.PLS.dao.UserDao
import top.macaulish.PLS.entity.FileInfoEntity
import top.macaulish.PLS.entity.TaskEntity
import top.macaulish.PLS.gson.JsonResponse
import top.macaulish.PLS.gson.TaskItem
import java.io.*
import java.util.*
import java.sql.Timestamp
import javax.servlet.http.HttpServletRequest

@Controller
@RequestMapping(value = ["/task"])
class TaskController{

    @Autowired
    lateinit var taskDao:TaskDao

    @Autowired
    lateinit var userDao: UserDao


    @Value("#{app.file_host}")
    lateinit var fileHost:String

    @Value("#{app.task_parent_dir}")
    lateinit var taskParent:String

    @Value("#{app.task_result_parent_dir}")
    lateinit var resultParent:String

    private val logger = LoggerFactory.getLogger(TaskController::class.java)

    @RequestMapping(value = ["/one.get"], method = [(RequestMethod.GET)])
    @ResponseBody
    fun queryTask(guid:String):String{
        logger.info("query Task called")
        return "queryTask"
    }

    @RequestMapping(value = ["/all.get"], method = [(RequestMethod.GET)],produces=["application/json;charset=utf-8"])
    @ResponseBody
    fun queryAllTask():String{
        var tasks = taskDao.queryAllTask()
        for(task in tasks){
            if(queryTaskState(task.guid) == "done"){
                task.state = "finish"
                taskDao.saveOfUpdate(task)
            }
        }
        tasks = taskDao.queryAllTask()
        val response:JsonResponse = JsonResponse()
        val tasklist = ArrayList<TaskItem>()
        for(task in tasks){
            val item = TaskItem()
            item.id = task.id
            item.guid = task.guid
            item.taskname = task.taskname?:""
            item.state = task.state?:""
            item.creatorId = task.creatorId?:0
            item.createTime = task.createTime
            item.targetModel = task.targetModel?:""
            item.saveHost = task.saveHost?:""
            item.savePath = task.savePath?:""
            item.creatorName = "admin"
            println(item.taskname)
            tasklist.add(item)
        }
        return response.successWithList(tasklist)
    }

    fun queryTaskState(taskGuid:String):String{
        var file = File("$resultParent/$taskGuid/result.zip")
        if(file.exists()){
            return "done"
        }
        return "handling"
    }

    @RequestMapping(value = ["/new.do"], method = [(RequestMethod.POST)])
    @ResponseBody
    fun newTask(request:HttpServletRequest):String{
        //stop here post 请求参数不对应
        val task = TaskEntity()
        task.taskname = request.getParameter("taskName")
        task.targetModel = request.getParameter("model")
        task.creatorId = 1 //当前没有用户管理模块
        task.guid = UUID.randomUUID().toString()
        task.state = "new"
        task.createTime = Timestamp(System.currentTimeMillis())
        return try{
            taskDao.saveOfUpdate(task)
            JsonResponse().successWith(task)
        }catch (e:Exception){
            JsonResponse().failWith("Fail to create the task ${task.taskname}.")
        }
    }

    @RequestMapping(value = ["/add.do"], method = [(RequestMethod.GET)])
    fun addContent(taskGuid:String):ModelAndView{
        val mv = ModelAndView()
        mv.viewName = "upload"
        val task = TaskEntity()
        task.guid = taskGuid
        mv.addObject("task",task)
        return mv
    }

    @RequestMapping(value = ["/check.do"], method = [(RequestMethod.GET)])
    fun checkTask(taskGuid:String):ModelAndView{
        val task = taskDao.queryTask(taskGuid)
        val mv = ModelAndView()
        return try{
            if(task == null){
                mv.viewName = "error"
                mv.addObject("error","The task dose't exist.")
            }else{
                mv.viewName = "upload"
                mv.addObject("task",task)
            }
            mv
        }catch (e:Exception){
            mv.viewName = "error"
            mv.addObject("error","Fail to create a new task!")
            mv
        }
    }

    @ResponseBody
    @RequestMapping(value= ["/upload.do"],method = [(RequestMethod.POST)])
    fun uploadFile(@RequestParam("files[]")file:MultipartFile,taskGuid:String):String {
        var task: TaskEntity = taskDao.queryTask(taskGuid) ?: return JsonResponse().failWith("Task doesn't exist.")
        val fileInfo = FileInfoEntity()
        fileInfo.fileName = file.originalFilename
        fileInfo.fileSize = FileKits.toReadableSize(file.size)
        fileInfo.guid = UUID.randomUUID().toString()
        fileInfo.saveHost = fileHost
        fileInfo.savePath = taskParent + "/" + taskGuid
        fileInfo.taskGuid = taskGuid
        val res = JSONObject()
        val con = JSONArray()
        val con1 = JSONObject()
        return try {
            taskDao.saveOfUpdate(fileInfo)
            task.state = "ready"
            taskDao.saveOfUpdate(task)
            con1.put("url", "/task/image.get?task=$taskGuid&file=${file.originalFilename}")
            con1.put("thumbnailUrl", "/task/miniimage.get?task=$taskGuid&file=${file.originalFilename}")
            con1.put("name", "$taskParent/$taskGuid/${file.originalFilename}")
            con1.put("type", "image/jpeg")
            con1.put("size", "${file.size}")
            con1.put("deleteUrl", "/task/image.del?task=$taskGuid&file=${file.originalFilename}")
            con1.put("deleteType", "DELETE")
            res.put("files", con.put(con1))
            file.transferTo(FileKits.getOrCreate("$taskParent/$taskGuid/"+file.originalFilename))
            res.toString()
        } catch (e: Exception) {
            res.put("files", JSONArray())
            res.toString()
        }
    }

    @RequestMapping(value = ["/ready.do"], method = [(RequestMethod.GET)])
    @ResponseBody
    fun getReady(taskGuid:String):String{
        val res =JsonResponse()
        if(taskDao.getReady(taskGuid)){
            res.successWith("Change task state to ready!")
        }else{
            res.failWith("Fail to change the state!")
        }
        return res.toString()
    }

    @RequestMapping(value = ["/model.get"], method = [(RequestMethod.GET)])
    @ResponseBody
    fun queryModel(modelGuid:String):String{
        val res =JsonResponse()
        return res.successWith("free")
    }

    @RequestMapping(value = ["/task.do"], method = [(RequestMethod.GET)])
    @ResponseBody
    fun handleSource(taskGuid:String):String{
        try {
            val task = taskDao.queryTask(taskGuid)
            if (task == null) return JsonResponse().failWith("Task does not exit!")
            val outDir = "$taskParent/$taskGuid"
            task.savePath = outDir
            task.state = "handling"
            return if (sendTask(taskGuid)) {
                taskDao.saveOfUpdate(task)
                JsonResponse().successWith("Try to launch the task.")
            }else {
                JsonResponse().failWith("The model may be busy or wrong.")
            }
        }catch (e:Exception){
            return JsonResponse().failWith("Unknown error:"+e.toString())
        }
    }


    @RequestMapping(value = ["/delete.do"], method = [(RequestMethod.GET)])
    @ResponseBody
    fun deleteTask(taskGuid:String):String{
        if(taskDao.taskDelete(taskGuid)) {
            return JsonResponse().successWith("success to delete task with guid:"+taskGuid)
        }
        return JsonResponse().failWith("fail to delete task with guid:"+taskGuid)
    }

    @RequestMapping(value = [""], method = [(RequestMethod.GET)])
    fun taskHome():String{
        return "pls"
    }

    @RequestMapping(value = ["/download.do"], method = [(RequestMethod.GET)],produces=["application/json;charset=utf-8"])
    @ResponseBody
    fun taskDownload(taskGuid:String): ResponseEntity<ByteArray> {
        var fileName = "unknown"
        val headers = HttpHeaders()
        val file = File("$resultParent/$taskGuid/result.zip")
        if(!file.exists() || !file.isFile) return ResponseEntity("File doesn't exist!".toByteArray(),headers, HttpStatus.BAD_REQUEST)
        val task = taskDao.queryTask(taskGuid)
        fileName =if(task != null) task.taskname+".zip" else file.name
        headers.contentType = MediaType.APPLICATION_OCTET_STREAM
        headers.setContentDispositionFormData("attachment", fileName)
        return ResponseEntity(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED)
    }

    @RequestMapping(value=["/source.get"],method = [(RequestMethod.GET)])
    @ResponseBody
    fun taskSource(taskGuid:String):String{
        return try {
            val files = taskDao.querySource(taskGuid)
            JsonResponse().successWithList(files)
        }catch (e:Exception){
            JsonResponse().failWith("Fail to get the files.")
        }
    }

    fun sendTask(taskGuid:String):Boolean{
        val source = "$taskParent/$taskGuid"
        val result = "$resultParent/$taskGuid"
        val log = "log.txt"
        val sh = "CUDA_VISIBLE_DEVICES=3 python2 \$DETECTRON/tools/infer_eng.py \\\n" +
                "\t--cfg \$DETECTRON/configs/panet/mask_bpa_adp_dcn_ctx_hh_res50.yaml \\\n" +
                "\t--image-ext jpg \\\n" +
                "\t--result-ext xml \\\n"+
                "\t--use-zip True \\\n"+
                "\t--output-dir " + result + " \\\n" +
                "\t--wts /DATACENTER1/wdk/tmp/mask_bpa_adp_dcn_hh_prelu_res50/train/coco_2017_train/generalized_rcnn/model_final.pkl \\\n" +
                "\t"+source + " | tee " + result+"/"+log+"\\\n"
        val strPath = "$taskParent/start.sh"
        val file = File(strPath)
        val fileParent = file.parentFile
        if (!fileParent.exists()) {
            fileParent.mkdirs()
        }
        file.createNewFile()

        try {
            var out= FileOutputStream(file,false)
            val p = PrintStream(out)
            p.print(sh)
            p.close()
            out.close()
        } catch (e: FileNotFoundException){
            e.printStackTrace()
            return false
        }
        try {
            val num = Runtime.getRuntime().exec("$taskParent/start.sh")
        } catch (e: IOException) {
            e.printStackTrace()
            return false
        }
        return true
    }
}