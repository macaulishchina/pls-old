package top.macaulish.PLS.dao

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.orm.hibernate5.HibernateTemplate
import org.springframework.stereotype.Component
import top.macaulish.PLS.entity.TaskEntity
import org.hibernate.criterion.DetachedCriteria
import org.hibernate.criterion.Property
import org.hibernate.criterion.Restrictions
import org.springframework.transaction.annotation.Transactional
import top.macaulish.PLS.entity.FileInfoEntity
import top.macaulish.PLS.entity.UserEntity


@Component
class UserDao {

    @Autowired
    private lateinit var hibernate: HibernateTemplate

    fun getUser(id:Int):UserEntity?{
        return hibernate.get(UserEntity::class.java,id)
    }

}