package com.sist.vo;
import java.text.SimpleDateFormat;
import java.util.*;

import lombok.Data;
/*
RNO     NOT NULL NUMBER       
ID               VARCHAR2(20) 
FNO              NUMBER       
DAY     NOT NULL VARCHAR2(20) 
TIME    NOT NULL VARCHAR2(20) 
INWON   NOT NULL VARCHAR2(20) 
REGDATE          DATE         
ISOK             CHAR(1)
 */
@Data
public class ReserveVO {
	
	private int rno,fno;
	private String id,day,time,inwon,isok,dbday;
	private Date regdate;
	
	private FoodVO fvo=new FoodVO(); // JOIN
}

