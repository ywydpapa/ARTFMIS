package kr.ghtech.artfms.setup.dto;

import lombok.Data;

@Data
public class SetupDTO {
	private Integer SETUP_ID;
	private String SETUP_TITLE;
	private String SETUP_CONTENTS;
	private String SETUP_KEY;
	private String SETUP_TYPE;
	private String SETUP_DESC;
	private String REG_DATE;
	private String MOD_DATE;
	private String ATTRIB;
	private String USE_YN;
	private String START_TIME;
	private String END_TIME;
	private Integer SETL_ID;
	private Integer SETL_FROOM_ID;
	private String SETL_TITLE;
	private String SETL_REMARK;
	private String SETL_USE_YN;
	private String SETL_PRICE;
	private String SETL_TYPE;
	private String PAY_YN;
	private String INCADD_YN;
	private Integer BCD_ID;
	private String BCD_TITLE;
}
