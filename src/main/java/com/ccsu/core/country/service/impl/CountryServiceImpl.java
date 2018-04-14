package com.ccsu.core.country.service.impl;

import com.ccsu.core.country.dao.CountryMapper;
import com.ccsu.core.country.domain.Country;
import com.ccsu.core.country.service.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/11
 * @Time: 11:44
 * Description:国家业务层
 */
@Service
public class CountryServiceImpl implements CountryService {

    @Autowired
    private CountryMapper countryMapper;

    @Override
    public void add(Country entity) throws Exception {

    }

    @Override
    public void delete(Integer id) throws Exception {

    }

    @Override
    public void update(Country entity) throws Exception {

    }

    @Override
    public Country load(Integer id) throws Exception {
        return null;
    }

    @Override
    public List<Country> findAll(String condition) throws Exception {
        return countryMapper.findAll(condition);
    }
}
