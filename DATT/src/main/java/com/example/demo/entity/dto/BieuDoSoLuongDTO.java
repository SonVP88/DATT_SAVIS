package com.example.demo.entity.dto;

import java.util.List;

public class BieuDoSoLuongDTO {

    private List<String> labels;

    private List<Integer> datasetData;

    public BieuDoSoLuongDTO() {
    }

    public List<String> getLabels() {
        return labels;
    }

    public void setLabels(List<String> labels) {
        this.labels = labels;
    }

    public List<Integer> getDatasetData() {
        return datasetData;
    }

    public void setDatasetData(List<Integer> datasetData) {
        this.datasetData = datasetData;
    }
}
