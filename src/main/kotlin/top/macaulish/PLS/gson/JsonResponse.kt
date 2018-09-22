package top.macaulish.PLS.gson

import com.google.gson.Gson
import com.google.gson.JsonObject
import com.google.gson.JsonParser
import com.mysql.cj.xdevapi.JsonString
import org.json.JSONObject
import org.json.JSONString
import org.springframework.stereotype.Component

@Component
class JsonResponse {

    var state:String = ""
    var data: ArrayList<*>? = null

    fun successWith(result:String):String{
        state = "success"
        data = ArrayList<String>()
        (data as ArrayList<String>).add(result)
        return Gson().toJson(this)
    }

    fun successWithList(result:ArrayList<*>):String{
        state = "success"
        data = result
        return Gson().toJson(this)
    }

    fun successWith(result:Any):String{
        state = "success"
        val list = ArrayList<Any>()
        list.add(result)
        data = list
        return Gson().toJson(this)
    }

    fun failWith(result:String):String{
        state = "fail"
        data = ArrayList<String>()
        (data as ArrayList<String>).add(result)
        return Gson().toJson(this)
    }




}