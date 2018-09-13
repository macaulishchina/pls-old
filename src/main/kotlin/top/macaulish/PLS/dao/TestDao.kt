package top.macaulish.PLS.dao

import java.util.UUID
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.orm.hibernate5.HibernateTemplate
import org.springframework.stereotype.Component
import org.springframework.transaction.annotation.Transactional
import top.macaulish.PLS.entity.UserEntity

@Component
class TestDao {

    @Autowired
    private lateinit var hibernate:HibernateTemplate

    @Transactional
    fun addUser():Boolean{
        val user = UserEntity()
        user.guid = UUID.randomUUID().toString()
        user.username = "user"
        user.password = "user"
        hibernate.save(user)
        return false
    }

}