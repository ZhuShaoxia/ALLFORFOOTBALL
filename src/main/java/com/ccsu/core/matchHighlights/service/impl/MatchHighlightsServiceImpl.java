package com.ccsu.core.matchHighlights.service.impl;

import com.ccsu.common.utils.CommonUtils;
import com.ccsu.core.matchHighlights.dao.MatchHighlightsMapper;
import com.ccsu.core.matchHighlights.domain.MatchHighlights;
import com.ccsu.core.matchHighlights.service.MatchHighlightsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 *
 * @author: Xiaolei Zhu
 * @Date: 2018/4/19
 * @Time: 10:17
 * Description:
 */
@Service
public class MatchHighlightsServiceImpl implements MatchHighlightsService {

    @Autowired
    private MatchHighlightsMapper matchHighlightsMapper;

    @Override
    public void add(MatchHighlights matchHighlights) throws Exception {
        String currentDateTime = CommonUtils.getCurrentDateTime();
        matchHighlights.setCreateTime(currentDateTime);
        matchHighlights.setModifiedTime(currentDateTime);
        matchHighlightsMapper.save(matchHighlights);
    }

    @Override
    public void delete(Integer id) throws Exception {
        matchHighlightsMapper.delete(id);
    }

    @Override
    public void update(MatchHighlights matchHighlights) throws Exception {
        String modifiedTime = CommonUtils.getCurrentDateTime();
        matchHighlights.setModifiedTime(modifiedTime);
    }

    @Override
    public MatchHighlights load(Integer id) throws Exception {
        return matchHighlightsMapper.findById(id);
    }

    @Override
    public List<MatchHighlights> findAll(String condition) throws Exception {
        return matchHighlightsMapper.findAll(null);
    }

    @Override
    public MatchHighlights findByMatchInfoId(Integer matchInfoId) {
        return matchHighlightsMapper.findByMatchInfoId(matchInfoId);
    }
}
