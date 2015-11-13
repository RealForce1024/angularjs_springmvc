package com.ice.personnel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ice.personnel.bean.User;
import com.ice.personnel.dao.UserDAO;

/**
 * @author ice
 * 
 */
public class UserServiceImpl implements IUserService {

    @Override
    public void saveOrUpdateUser(User user) {
        userDAO.saveOrUpdate(user);
    }

    @Override
    public List<User> getUserList(int page, int pageSize) {
        List<User> list = userDAO.getUserList(page, pageSize);
        return list;
    }

    @Override
    public void deleteUser(User user) {
        userDAO.deleteUser(user);
    }

    /**
     * 用户DAO
     */
    @Autowired
    private UserDAO userDAO;

}
