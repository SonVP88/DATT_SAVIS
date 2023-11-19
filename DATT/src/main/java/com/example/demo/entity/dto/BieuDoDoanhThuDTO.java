package com.example.demo.entity.dto;

import java.util.List;

public class BieuDoDoanhThuDTO {
    private List<String> labels;

    private List<Double> datasetData;

    public BieuDoDoanhThuDTO() {
    }

    public List<String> getLabels() {
        return labels;
    }

    public void setLabels(List<String> labels) {
        this.labels = labels;
    }

    public List<Double> getDatasetData() {
        return datasetData;
    }

    public void setDatasetData(List<Double> datasetData) {
        this.datasetData = datasetData;
    }
}
