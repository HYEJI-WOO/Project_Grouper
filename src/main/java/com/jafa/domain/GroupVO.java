package com.jafa.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class GroupVO {
    private Long ano;
    private Long bno;
    private String groupName;
    private String memberId;
    private String name;
    private String phone;
    private String promise;
    private String approve;

}

