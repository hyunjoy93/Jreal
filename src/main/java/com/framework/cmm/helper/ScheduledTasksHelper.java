package com.framework.cmm.helper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.framework.chk.controller.ChkScheduler;

@Component
public class ScheduledTasksHelper {

	Logger log = LoggerFactory.getLogger(this.getClass());
	

	@Autowired
	ChkScheduler chkScheduler;

	//@Scheduled(fixedRate = 7000)
	public void getScheduled() throws Exception {
		log.info("====================================== getScheduled ======================================");

		log.info("===================================== 정기점검 스케줄링 시작 =====================================");
		try {
			chkScheduler.test2();
			log.info("===================================== 정기점검 스케줄링 정상 =====================================");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
