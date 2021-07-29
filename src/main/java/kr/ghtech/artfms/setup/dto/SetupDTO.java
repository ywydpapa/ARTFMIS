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
}
