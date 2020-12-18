package com.house.test;

import com.house.entity.House;
import com.house.mapper.HouseMapper;
import com.house.service.IHouseService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-persist-mybatis.xml","classpath:spring-web-mvc.xml"})
public class Test {

    @Autowired
    private IHouseService houseService;

    @org.junit.Test
    public void test() {
        House house  = new House();
        house.setHouseDesc("好房子，朝向好！");
        house.setHouseModel("三室一厅");
        house.setHouseArea("150");
        house.setHouseFloor("10");
        house.setHouseType("整租");
        house.setHouseAddress("江苏省南京市江宁区");
        house.setHouseImage("https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/04/6da19494d6dd4a0db90b4bd135d41e1aIMG_20170616_103815.jpg");
        house.setCommunityName("幸福小区");
        house.setHouseLinkMan("15195959128");
        house.setHouseOriented("南北");
        house.setHouseDetailsImg("https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/04/126a7a2d8b45402c9a15e73f0572aca7IMG_20170618_151105.jpg:-:https://ycymmd.oss-cn-beijing.aliyuncs.com/2020/12/04/f91cbdd5c9a74d4da8c1411053258a12IMG_20170618_151020.jpg:-:");
        house.setPublisher("bbb");
        house.setHousePrice(1000);
        for (int i = 0; i < 10; i++) {
            houseService.addNewHouse(house);
        }
    }
}
