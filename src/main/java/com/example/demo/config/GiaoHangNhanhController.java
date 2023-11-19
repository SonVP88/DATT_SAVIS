package com.example.demo.config;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import com.example.demo.entity.dto.TransportationFeeDTO;

@RestController
@RequestMapping("/public/")
@CrossOrigin("*")
public class GiaoHangNhanhController {

    private static final String API_BASE_URL = "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/";

    @GetMapping("/provinces")
    public String getAllProvinces() {
        try {
            RestTemplate restTemplate = new RestTemplate();
            HttpHeaders headers = new HttpHeaders();
            headers.set("token", "79bb4b5a-7c7d-11ee-a6e6-e60958111f48");
            headers.set("Content-Type", "application/json");
            HttpEntity<String> entity = new HttpEntity<>(headers);
            ResponseEntity<String> response = restTemplate.exchange(API_BASE_URL + "province", HttpMethod.GET, entity, String.class);

            if (response.getStatusCode().is2xxSuccessful()) {
                return response.getBody();
            } else {
                return null;
            }
        } catch (HttpClientErrorException e) {
            return "";
        }
    }

    @GetMapping("/districts")
    public String getDistrictsByProvince(@RequestParam("province_id") Integer provinceId) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            HttpHeaders headers = new HttpHeaders();
            headers.set("token", "79bb4b5a-7c7d-11ee-a6e6-e60958111f48");
            headers.set("Content-Type", "application/json");
            HttpEntity<String> entity = new HttpEntity<>(headers);
            ResponseEntity<String> response = restTemplate.exchange(API_BASE_URL + "district?province_id=" + provinceId, HttpMethod.GET, entity, String.class);

            if (response.getStatusCode().is2xxSuccessful()) {
                return response.getBody();
            } else {
                return null;
            }
        } catch (HttpClientErrorException e) {
            return "";
        }
    }

    @GetMapping("/wards")
    public String getWardsByDistrict(@RequestParam("district_id") Integer districtId) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            HttpHeaders headers = new HttpHeaders();
            headers.set("token", "79bb4b5a-7c7d-11ee-a6e6-e60958111f48");
            headers.set("Content-Type", "application/json");
            HttpEntity<String> entity = new HttpEntity<>(headers);
            ResponseEntity<String> response = restTemplate.exchange(API_BASE_URL + "ward?district_id=" + districtId, HttpMethod.GET, entity, String.class);

            if (response.getStatusCode().is2xxSuccessful()) {
                return response.getBody();
            } else {
                return null;
            }
        } catch (HttpClientErrorException e) {
            return "";
        }
    }

    @PostMapping("/transportationFee")
    public String getFee(@RequestBody TransportationFeeDTO transportationFeeDTO){
        try {
            RestTemplate restTemplate = new RestTemplate();

            // Tạo tiêu đề
            HttpHeaders headers = new HttpHeaders();
            headers.set("token", "79bb4b5a-7c7d-11ee-a6e6-e60958111f48");
            headers.set("Content-Type", "application/json"); // Thay thế tên và giá trị của tiêu đề cần thiết

            // Tạo đối tượng HttpEntity chứa tiêu đề
            HttpEntity<String> entity = new HttpEntity<>(headers);

            // Thực hiện yêu cầu HTTP với tiêu đề
//            ResponseEntity<String> response = restTemplate.exchange(
//                    "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee?service_type_id=2&from_district_id=3303&to_district_id=" + transportationFeeDTO.getToDistrictId() + "&to_ward_code=" + transportationFeeDTO.getToWardCode() + "&height=" + TransportationFeeDTO.heightProduct * transportationFeeDTO.getQuantity() + "&length=" + TransportationFeeDTO.lengthProduct * transportationFeeDTO.getQuantity() + "&weight=" + TransportationFeeDTO.weightProduct * transportationFeeDTO.getQuantity() + "&width=" + TransportationFeeDTO.widthProduct * transportationFeeDTO.getQuantity() + "&insurance_value=" + transportationFeeDTO.getInsuranceValue(), HttpMethod.GET, entity, String.class);
            ResponseEntity<String> response = restTemplate.exchange(
                    "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee?service_type_id=2&from_district_id=3303&to_district_id=" + transportationFeeDTO.getToDistrictId() + "&to_ward_code=" + transportationFeeDTO.getToWardCode() + "&height=" + TransportationFeeDTO.heightProduct + "&length=" + TransportationFeeDTO.lengthProduct + "&weight=" + TransportationFeeDTO.weightProduct * transportationFeeDTO.getQuantity() + "&width=" + TransportationFeeDTO.widthProduct * transportationFeeDTO.getQuantity() + "&insurance_value=" + transportationFeeDTO.getInsuranceValue(), HttpMethod.GET, entity, String.class);
            if (response.getStatusCode().is2xxSuccessful()) {
                return response.getBody();
            } else {
                // Xử lý khi có lỗi
                return null;
            }
        }catch (Exception e){
            return null;
        }
    }
}
