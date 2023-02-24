package com.jafa.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class BoardVO {
	private int bno;
    private String groupName;
    private String category;
    private String location;
    private String offlineLocation;
    private int capacity;
    private Date startDate;
    private String details;
    private String author;
    private char isStarted;
}
