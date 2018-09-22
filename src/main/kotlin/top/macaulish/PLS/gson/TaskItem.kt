package top.macaulish.PLS.gson

import java.sql.Timestamp

class TaskItem {
    var id: Int = 0
    var guid: String = ""
    var taskname: String = ""
    var state: String = ""
    var targetModel: String = ""
    var createTime: Timestamp? = null
    var creatorId: Int = 0
    var creatorName:String = ""
    var savePath:String = ""
    var saveHost:String = ""
}