package top.macaulish.PLS.control

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.ResponseBody
import top.macaulish.PLS.gson.JsonResponse
import top.macaulish.PLS.gson.TaskItem
import java.util.ArrayList

@Controller
@RequestMapping(value = ["/model"])
class ModelController {
    @RequestMapping(value = ["/state.get"], method = [(RequestMethod.GET)],produces=["application/json;charset=utf-8"])
    @ResponseBody
    fun queryModelState():String{
        return JsonResponse().successWith(queryModel())
    }

    fun queryModel():String{
        return "free"
    }
}