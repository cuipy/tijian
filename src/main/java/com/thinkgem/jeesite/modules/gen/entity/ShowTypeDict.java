package com.thinkgem.jeesite.modules.gen.entity;

import com.thinkgem.jeesite.modules.sys.entity.Dict;
import org.hibernate.validator.constraints.Length;

import javax.xml.bind.annotation.XmlAttribute;

public class ShowTypeDict extends Dict {

    private String treeUrl;

    @XmlAttribute
    @Length(min=1, max=200)
    public String getTreeUrl() {
        return treeUrl;
    }

    public void setTreeUrl(String treeUrl) {
        this.treeUrl = treeUrl;
    }
}
