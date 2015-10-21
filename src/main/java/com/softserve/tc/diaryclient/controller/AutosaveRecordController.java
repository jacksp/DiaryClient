package com.softserve.tc.diaryclient.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.softserve.tc.diaryclient.autosave.RecordJAXBParser;
import com.softserve.tc.diaryclient.entity.Record;
import com.softserve.tc.diaryclient.log.Log;


@Controller
public class AutosaveRecordController {
    
    private Logger logger =
            Log.init(AutosaveRecordController.class.toString());
            
    @RequestMapping(value = "/addRecord/save", method = RequestMethod.POST,
            headers = "content-type=application/json")
    public void save(@RequestBody Record record) {
        logger.info("Get record from request");
        logger.info("Save record to xml");
        RecordJAXBParser jaxb = new RecordJAXBParser();
        jaxb.marshalTextToFile(record,
                record.getNick() + "-tempRecord.xml");
                
    }
}
