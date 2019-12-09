//package com.helin.crud.test;
//
//import java.util.List;
//
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mock.web.MockHttpServletRequest;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.context.web.WebAppConfiguration;
//import org.springframework.test.web.servlet.MockMvc;
//import org.springframework.test.web.servlet.MvcResult;
//import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
//import org.springframework.test.web.servlet.setup.MockMvcBuilders;
//import org.springframework.web.context.WebApplicationContext;
//
//import com.github.pagehelper.PageInfo;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@WebAppConfiguration
//@ContextConfiguration(locations = { "classpath:applicationContext.xml"
//		,"file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
//public class MvcTest {
//
//	//����Springmvc��IOC
//	@Autowired
//	private WebApplicationContext context;
//	//����mvc���󣬻�ȡ��������
//	private MockMvc mockMvc;
//	@Before
//	public void initMockMvc() {
//		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
//	}
//	
//	@Test
//	public void testPage() throws Exception {
//		
//		//ģ�������õ�����ֵ
//		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/urls").param("pn", "1")).andReturn();
//		//����ɹ��Ժ��������л���pageInfo�����ǿ���ȡ��pageInfo������֤
//		MockHttpServletRequest request =  result.getRequest();
//		PageInfo attribute = (PageInfo) request.getAttribute("pageInfo");
//		
//		System.out.println("��ǰҳ�룺"+attribute.getPageNum());
//		System.out.println("��ҳ�룺"+attribute.getPages());
//		System.out.println("�ܼ�¼����"+attribute.getTotal());
//		System.out.println("��ҳ����Ҫ������ʾ��ҳ�룺");
//		
//		int [] nums = attribute.getNavigatepageNums();
//		for(int i:nums) {
//			System.out.println(" "+i);
//		}
//		
//		//��ȡԱ������
//		List<Url> list = attribute.getList();
//		for(Url url :list) {
//			System.out.println("ID:"+url.getUrlId()+"==>Name:"+url.getUrlName());
//		}
//	}
//}
