package top.macaulish.PLS.dao

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.orm.hibernate5.HibernateTemplate
import org.springframework.stereotype.Component
import top.macaulish.PLS.entity.TaskEntity
import org.hibernate.criterion.DetachedCriteria
import org.hibernate.criterion.Order
import org.springframework.transaction.annotation.Transactional
import top.macaulish.PLS.entity.FileInfoEntity
import top.macaulish.PLS.entity.UserEntity


@Component
class TaskDao {

    @Autowired
    private lateinit var hibernate: HibernateTemplate

    @Transactional
    fun queryAllTask():List<TaskEntity>{
        val query = DetachedCriteria.forClass(TaskEntity::class.java).addOrder(Order.desc("createTime"))
        return hibernate.findByCriteria(query) as List<TaskEntity>
    }

    @Transactional
    fun queryTask(guid:String):TaskEntity?{
        val example = TaskEntity()
        example.guid = guid
        val list = hibernate.findByExample(example)
        if(list.isEmpty()) return null
        return list[0]
    }

    @Transactional
    fun saveOfUpdate(task:TaskEntity){
        hibernate.saveOrUpdate(task)
    }

    @Transactional
    fun saveOfUpdate(fileInfo:FileInfoEntity){
        hibernate.save(fileInfo)
    }

    fun query(id:Int):UserEntity?{
        return hibernate.get(UserEntity::class.java,id)
    }

    @Transactional(readOnly = false)
    fun getReady(guid:String):Boolean{
        val example = TaskEntity()
        example.guid = guid
        val tasklist = hibernate.findByExample(example)
        return if(tasklist.isEmpty()) {false}else{ tasklist[0].state = "ready";true}
    }

    @Transactional(readOnly = false)
    fun taskDelete(guid:String):Boolean{
        val example = TaskEntity()
        example.guid = guid
        val tasklist = hibernate.findByExample(example)
        if(tasklist.isEmpty()) return false
        hibernate.delete(tasklist[0])
        return true
    }
}