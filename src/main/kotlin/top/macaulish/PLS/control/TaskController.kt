package top.macaulish.PLS.control

import org.slf4j.LoggerFactory
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.ResponseBody

@Controller
@RequestMapping(value = ["/task"])
class TaskController{
    private val logger = LoggerFactory.getLogger(TaskController::class.java)

    @RequestMapping(value = ["/task.get"], method = [(RequestMethod.GET)])
    @ResponseBody
    fun queryTask(guid:String):String{
        logger.info("query Task called")
        return "queryTask"
    }

    @RequestMapping(value = ["/task.get"], method = [(RequestMethod.GET)])
    @ResponseBody
    fun queryAllTask():String{

        return "queryTask"
    }


}