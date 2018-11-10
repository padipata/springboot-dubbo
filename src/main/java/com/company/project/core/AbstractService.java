package com.company.project.core;


import org.apache.ibatis.exceptions.TooManyResultsException;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.entity.Condition;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * 基于通用MyBatis Mapper插件的Service接口的实现
 */
public abstract class AbstractService<T> implements Service<T> {

    @Autowired
    protected Mapper<T> mapper;

    private Class<T> modelClass;    // 当前泛型真实类型的Class

    public AbstractService() {
        ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
        modelClass = (Class<T>) pt.getActualTypeArguments()[0];
    }

    public void save(T model) {
        System.out.println("------------传参------------");
        System.out.println(model);
        System.out.println("---------------------------");
        mapper.insertSelective(model);
    }

    public void save(List<T> models) {
        System.out.println("------------传参------------");
        System.out.println(models);
        System.out.println("---------------------------");
        mapper.insertList(models);
    }

    public void deleteById(Integer id) {
        System.out.println("------------传参------------");
        System.out.println(id);
        System.out.println("---------------------------");
        mapper.deleteByPrimaryKey(id);
    }

    public void deleteByIds(String ids) {
        System.out.println("------------传参------------");
        System.out.println(ids);
        System.out.println("---------------------------");
        mapper.deleteByIds(ids);
    }

    public void update(T model) {
        System.out.println("------------传参------------");
        System.out.println(model);
        System.out.println("---------------------------");
        mapper.updateByPrimaryKeySelective(model);
    }

    public T findById(Integer id) {
        System.out.println("------------传参------------");
        System.out.println(id);
        System.out.println("---------------------------");
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public T findBy(String fieldName, Object value) throws TooManyResultsException {
        try {
            T model = modelClass.newInstance();
            Field field = modelClass.getDeclaredField(fieldName);
            field.setAccessible(true);
            field.set(model, value);
            return mapper.selectOne(model);
        } catch (ReflectiveOperationException e) {
            throw new ServiceException(e.getMessage(), e);
        }
    }

    public List<T> findByIds(String ids) {
        System.out.println("------------传参------------");
        System.out.println(ids);
        System.out.println("---------------------------");
        return mapper.selectByIds(ids);
    }

    public List<T> findByCondition(Condition condition) {
        System.out.println("------------传参------------");
        System.out.println(condition);
        System.out.println("---------------------------");
        return mapper.selectByCondition(condition);
    }

    public List<T> findAll() {
        return mapper.selectAll();
    }
}
