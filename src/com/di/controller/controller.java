package com.di.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FilenameFilter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.di.bean.BundleLogBean;
import com.di.bean.ChallanBean;
import com.di.bean.ChallanLineBean;
import com.di.bean.ChallanOutBean;
import com.di.bean.ChallanOutLineBean;
import com.di.bean.CurrencyBean;
import com.di.bean.CustomerBean;
import com.di.bean.CustomerProductBean;
import com.di.bean.CustomerProductRateBean;
import com.di.bean.CustomerTypeBean;
import com.di.bean.HandoverBean;
import com.di.bean.HandoverStoneBean;
import com.di.bean.InvoiceBean;
import com.di.bean.InvoiceLineBean;
import com.di.bean.PaymentBean;
import com.di.bean.ProductMasterBean;
import com.di.bean.ProductProcessBean;
import com.di.bean.RateCriteriaBean;
import com.di.bean.SltlInvoiceLineBean;
import com.di.bean.SltlinvoiceBean;
import com.di.bean.StatusBean;
import com.di.bean.UserBean;
import com.di.bean.WorkHistoryBean;
import com.di.bean.WorkProductBean;
import com.di.bean.WorkProductProcessBean;
import com.di.dao.AllCountDAO;
import com.di.dao.AllDeleteDAO;
import com.di.dao.AllInsertDAO;
import com.di.dao.AllListDAO;
import com.di.dao.AllUpdateDAO;
import com.diSync.controller.sync;
import com.diSync.liveDAO.AllLiveUpdateDAO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class controller {

	AllInsertDAO allInsertDAO = new AllInsertDAO();
	AllUpdateDAO allUpdateDAO = new AllUpdateDAO();
	AllListDAO allListDAO = new AllListDAO();
	AllDeleteDAO allDeleteDAO = new AllDeleteDAO();
	AllCountDAO allCountDAO = new AllCountDAO();

	AllLiveUpdateDAO allLiveUpdateDAO = new AllLiveUpdateDAO();

	// for redirect page using encode decode method apache base64
	@RequestMapping(value = "/redirect", method = RequestMethod.GET) // Mapping for Call the controller
	public String redirect(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String page = request.getParameter("p");

		String decodeText = new EncodeDecode().decodeString(page);
		return decodeText;
	}

	// for redirect page using encode decode method apache base64
	@RequestMapping(value = "/redirectToDetails", method = RequestMethod.GET) // Mapping for Call the controller
	public String redirectToDetails(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String decodeText = new EncodeDecode().decodeString("d29ya0hpc3RvcnlEZXRhaWxz");

		return decodeText;
	}

	@RequestMapping(value = "/insertProduct", method = RequestMethod.POST) // Mapping for Call the controller
	public String insertProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String pName = request.getParameter("pName");
		String pCategory = request.getParameter("pCategory");
		int active = 1;

		ProductMasterBean productMasterBean = new ProductMasterBean(pName, pCategory, new Date(), active);

		boolean result = allInsertDAO.productInsert(productMasterBean);

		response.sendRedirect("redirect?p=cHJvZHVjdE1hc3Rlcg==");

		return null;
	}

	@RequestMapping(value = "/updateProduct", method = RequestMethod.POST) // Mapping for Call the controller
	public String updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pId = Integer.parseInt(request.getParameter("pId"));
		String pName = request.getParameter("pName");
		String pCategory = request.getParameter("pCategory");
		int active = 1;

		ProductMasterBean productMasterBean = new ProductMasterBean(pId, pName, pCategory, new Date(), active);

		boolean result = allUpdateDAO.productUpdate(productMasterBean);

		response.sendRedirect("redirect?p=cHJvZHVjdE1hc3Rlcg==");

		return null;
	}

	@RequestMapping(value = "/addChildStoneDynamically", method = RequestMethod.POST) // Mapping for Call the controller
	public String addChildStoneDynamically(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		int pId = Integer.parseInt(request.getParameter("pId"));
		String pName = request.getParameter("pName");
		String pCategory = request.getParameter("pCategory");
		int active = 1;

		ProductMasterBean productMasterBean = new ProductMasterBean(pId, pName, pCategory, new Date(), active);

		boolean result = allUpdateDAO.productUpdate(productMasterBean);

		response.sendRedirect("redirect?p=YWRkQ2hpbGRTdG9uZUR5bmFtaWNhbGx5");

		return null;
	}

	@RequestMapping(value = "/stoneDetail", method = RequestMethod.GET) // Mapping for Call the controller
	@ResponseBody
	public String stoneDetail(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");

		System.out.println("kkskks" + id);

		WorkHistoryBean workHistoryBean = allListDAO.workHistoryId(id);

		// This is use for convert data into json format
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(workHistoryBean);

		response.getWriter().print(jsonArray);

		return null;
	}

	@RequestMapping(value = "/deactiveProduct", method = RequestMethod.GET) // Mapping for Call the controller
	public String deactiveProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pId = Integer.parseInt(request.getParameter("pId"));
		int active = 0;

		boolean result = allUpdateDAO.deactivateProduct(pId, active);

		response.sendRedirect("redirect?p=cHJvZHVjdE1hc3Rlcg==");

		return null;
	}

	@RequestMapping(value = "/detailsOfProductMaster", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String detailsOfProductMaster(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pId = Integer.parseInt(request.getParameter("pId"));
		int active = 0;

		// Call the method for get details of Specification Of Field Detail
		ProductMasterBean productMasterBean = allListDAO.productDetails(pId);

		// This is use for convert data into json format
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(productMasterBean);

		return jsonArray;
	}

	@RequestMapping(value = "/insertCustomer", method = RequestMethod.POST) // Mapping for Call the controller
	public String insertCustomer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String fName = request.getParameter("fName");
		String cName = request.getParameter("cName");
		String gstNumber = request.getParameter("gstNumber");
		String cNoOne = request.getParameter("cNoOne");
		String cNoTwo = request.getParameter("cNoTwo");
		String emailOne = request.getParameter("emailOne");
		String emailTwo = request.getParameter("emailTwo");
		String address = request.getParameter("address");
		String zipCode = request.getParameter("zipCode");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String vatNumber = request.getParameter("vatNumber");
		String invSeq = request.getParameter("inv_seq");
		String challanSeq = request.getParameter("challan_seq");
		int parent_id = Integer.parseInt(request.getParameter("parent_id"));
		int uId = Integer.parseInt(request.getParameter("uId"));
		double vat_rate = 0;
		double cgst = 0;
		double sgst = 0;
		double igst = 0;

		try {
			vat_rate = Double.parseDouble(request.getParameter("vatRate"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		try {
			cgst = Double.parseDouble(request.getParameter("cgst"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		try {
			sgst = Double.parseDouble(request.getParameter("sgst"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		try {
			igst = Double.parseDouble(request.getParameter("igst"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		UserBean userBean = new UserBean();
		userBean.setUser_id(uId);

		String parent_customer_code = "-";
		CustomerBean c = allListDAO.customerDetails(parent_id);
		if (c != null) {
			parent_customer_code = c.getCustomer_code();
		}

		int maxCustomer = allListDAO.getMaxNumberOfCustomerByPId(parent_id);

		int nextNum = maxCustomer + 1;
		String number = String.format("%05d", nextNum);
		String cCode = "";
		if (parent_id == 0) {
			cCode = "C-" + number;
		} else {
			cCode = "SC-" + number + "_" + c.getCustomer_num();
		}

		int active = 1;
		CustomerBean customerBean = new CustomerBean(fName, cName, gstNumber, cNoOne, cNoTwo, emailOne, emailTwo,
				address, zipCode, city, state, country, new Date(), active, new Date(), cCode, nextNum, vatNumber,
				parent_id, parent_customer_code, userBean, vat_rate, invSeq, challanSeq, cgst, sgst, igst);
		int custId = 0;
		if (parent_id == 0) {
			boolean result = allInsertDAO.customerInsert(customerBean);
			custId = customerBean.getCustomer_id();
		} else {
			boolean result = allInsertDAO.subCustomerInsert(customerBean);
			custId = customerBean.getCustomer_id();
		}

		/* Create User */

		/*
		 * Here Authority 1 = Admin 2 = Manager 3 = Operator
		 */
		if (parent_id == 0) {

			String name = "Manager of " + cName;
			String username = String.valueOf(cName.replaceAll("\\s", "").charAt(0)).toLowerCase() + ""
					+ String.valueOf(cName.replaceAll("\\s", "").charAt(1)).toLowerCase() + "manager" + nextNum;
			int authority = 2; // Manager
			long randNum = Math.round(Math.random() * 1000000);
			String password = new AESEncrypt().encrypt(String.valueOf(randNum));

			UserBean mangerUser = new UserBean(name, username, password, new Date(), active, cCode, authority, custId);
			boolean insertManager = allInsertDAO.userInsert(mangerUser);

			name = "Operator of " + cName;
			username = String.valueOf(cName.replaceAll("\\s", "").charAt(0)).toLowerCase() + ""
					+ String.valueOf(cName.replaceAll("\\s", "").charAt(1)).toLowerCase() + "operator" + nextNum;
			authority = 3; // Operator
			randNum = Math.round(Math.random() * 1000000);
			password = new AESEncrypt().encrypt(String.valueOf(randNum));

			UserBean operatorUser = new UserBean(name, username, password, new Date(), active, cCode, authority,
					custId);
			boolean insertOperator = allInsertDAO.userInsert(operatorUser);

		}

		/* Create Sub Client for this */

		if (parent_id == 0) {

			int parent_id_s = customerBean.getCustomer_id();
			String p_cust_code = cCode;

			int maxCustomer1 = allListDAO.getMaxNumberOfCustomerByPId(parent_id_s);
			int nextNum1 = maxCustomer1 + 1;

			String number1 = String.format("%05d", nextNum1);
			String custmorCode = "SC-" + number1 + "_" + nextNum;

			invSeq = "";
			challanSeq = "";

			CustomerBean subcustomerBean = new CustomerBean(fName, cName, gstNumber, cNoOne, cNoTwo, emailOne, emailTwo,
					address, zipCode, city, state, country, new Date(), active, new Date(), custmorCode, nextNum1,
					vatNumber, parent_id_s, p_cust_code, userBean, vat_rate, invSeq, challanSeq, cgst, sgst, igst);
			boolean resultSubCustomer = allInsertDAO.subCustomerInsert(subcustomerBean);

		}

		/* For Sync Customer */
		HttpSession session = request.getSession();
		String diamondSession = new EncodeDecode().encodeString("diamondSession");
		UserBean usession = (UserBean) session.getAttribute(diamondSession);
		final String custIdSession = String.valueOf(usession.getCustomer_id());
		new Thread(new Runnable() {
			public void run() {
				new sync().customerSync(custIdSession);
			}
		}).start();
		/* For Sync Customer */

		String encodeCust_id = new EncodeDecode().encodeString(String.valueOf(parent_id));

		if (request.getParameter("subRedirection") != null) {
			response.sendRedirect("redirect?p=Y3VzdG9tZXJTdWJNYXN0ZXI=&pId=" + encodeCust_id);
		} else {
			response.sendRedirect("redirect?p=Y3VzdG9tZXJNYXN0ZXI=");
		}

		return null;
	}

	@RequestMapping(value = "/deactiveCustomer", method = RequestMethod.GET) // Mapping for Call the controller
	public String deactiveCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pId = Integer.parseInt(request.getParameter("cId"));

		int active = 0;

		boolean result = allUpdateDAO.deactivateCustomer(pId, active);

		/* For Sync Customer */
		HttpSession session = request.getSession();
		String diamondSession = new EncodeDecode().encodeString("diamondSession");
		UserBean usession = (UserBean) session.getAttribute(diamondSession);
		final String custIdSession = String.valueOf(usession.getCustomer_id());
		new Thread(new Runnable() {
			public void run() {
				new sync().customerSync(custIdSession);
			}
		}).start();
		/* For Sync Customer */

		if (request.getParameter("parent_id") != null) {
			int parent_id = Integer.parseInt(request.getParameter("parent_id"));
			String encodeCust_id = new EncodeDecode().encodeString(String.valueOf(parent_id));
			response.sendRedirect("redirect?p=Y3VzdG9tZXJTdWJNYXN0ZXI=&pId=" + encodeCust_id);
		} else {
			response.sendRedirect("redirect?p=Y3VzdG9tZXJNYXN0ZXI=");
		}

		return null;
	}

	@RequestMapping(value = "/detailsOfCustomerMaster", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String detailsOfCustomerMaster(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int cId = Integer.parseInt(request.getParameter("cId"));
		int active = 0;

		// Call the method for get details of Specification Of Field Detail
		CustomerBean customerBean = allListDAO.customerDetails(cId);

		// This is use for convert data into json format
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(customerBean);

		return jsonArray;
	}

	@RequestMapping(value = "/updateCustomer", method = RequestMethod.POST) // Mapping for Call the controller
	public String updateCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int cId = Integer.parseInt(request.getParameter("cId"));
		int maxNum = Integer.parseInt(request.getParameter("maxNum"));
		String cCode = request.getParameter("cCode");
		String fName = request.getParameter("fName");
		String cName = request.getParameter("cName");
		String gstNumber = request.getParameter("gstNumber");
		String cNoOne = request.getParameter("cNoOne");
		String cNoTwo = request.getParameter("cNoTwo");
		String emailOne = request.getParameter("emailOne");
		String emailTwo = request.getParameter("emailTwo");
		String address = request.getParameter("address");
		String zipCode = request.getParameter("zipCode");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String vatNumber = request.getParameter("vatNumber");
		String invSeq = request.getParameter("inv_seq");
		String challanSeq = request.getParameter("challan_seq");
		int parent_id = Integer.parseInt(request.getParameter("parent_id"));

		double vat_rate = 0;

		double cgst = 0;
		double sgst = 0;
		double igst = 0;

		try {
			vat_rate = Double.parseDouble(request.getParameter("vatRate"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		try {
			cgst = Double.parseDouble(request.getParameter("cgst"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		try {
			sgst = Double.parseDouble(request.getParameter("sgst"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		try {
			igst = Double.parseDouble(request.getParameter("igst"));
		} catch (Exception e) {
			// TODO: handle exception
		}

		String parent_customer_code = "-";

		CustomerBean c = allListDAO.customerDetails(parent_id);
		if (c != null) {
			parent_customer_code = c.getCustomer_code();
		}
		int active = 1;

		int uId = Integer.parseInt(request.getParameter("uId"));

		UserBean userBean = new UserBean();
		userBean.setUser_id(uId);

		CustomerBean customerBean = new CustomerBean(cId, fName, cName, gstNumber, cNoOne, cNoTwo, emailOne, emailTwo,
				address, zipCode, city, state, country, new Date(), active, new Date(), cCode, maxNum, vatNumber,
				parent_id, parent_customer_code, userBean, vat_rate, invSeq, challanSeq, cgst, sgst, igst);

		boolean result = allUpdateDAO.customerUpdate(customerBean);

		/* For Sync Customer */
		HttpSession session = request.getSession();
		String diamondSession = new EncodeDecode().encodeString("diamondSession");
		UserBean usession = (UserBean) session.getAttribute(diamondSession);
		final String custIdSession = String.valueOf(usession.getCustomer_id());
		new Thread(new Runnable() {
			public void run() {
				new sync().customerSync(custIdSession);
			}
		}).start();
		/* For Sync Customer */

		String encodeCust_id = new EncodeDecode().encodeString(String.valueOf(parent_id));

		if (request.getParameter("subRedirection") != null) {
			response.sendRedirect("redirect?p=Y3VzdG9tZXJTdWJNYXN0ZXI=&pId=" + encodeCust_id);
		} else {
			response.sendRedirect("redirect?p=Y3VzdG9tZXJNYXN0ZXI=");
		}

		return null;
	}

	@RequestMapping(value = "/insertWork", method = RequestMethod.POST) // Mapping for Call the controller
	public String insertWork(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {

		int custId = Integer.parseInt(request.getParameter("custId"));
		String kapanName = request.getParameter("kapanName");
		String lotName = request.getParameter("lotName");
		String priority = request.getParameter("priority");
		String clearity = request.getParameter("clearity");

		int pId = Integer.parseInt(request.getParameter("pId"));
		String stoneNum = request.getParameter("stoneNum");

		int uId = Integer.parseInt(request.getParameter("uId"));

		UserBean userBean = new UserBean();
		userBean.setUser_id(uId);

		int active = 1;

		CustomerBean c = allListDAO.customerDetails(custId);

		String PIDS = request.getParameter("PIDS");

		CustomerBean customerBean = new CustomerBean();
		ProductMasterBean productMasterBean = new ProductMasterBean();
		productMasterBean.setProduct_master_id(pId);
		customerBean.setCustomer_id(custId);

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date insertDate = new Date();
		Date startDate = simpleDateFormat.parse("1900-01-01");
		Date completinDate = simpleDateFormat.parse("1900-01-01");
		Date deactiveDate = simpleDateFormat.parse("1900-01-01");
		Date instockDate = simpleDateFormat.parse("1900-01-01");
		Date clearedDate = simpleDateFormat.parse("1900-01-01");

		String bundleNum = c.getCustomer_id() + "" + new SimpleDateFormat("yymmddhhmmss").format(insertDate);

		int in_stock = 0;
		String parent_id = "0";

		StatusBean statusBean = new StatusBean();
		statusBean.setStatus_id(1);

		String[] colorArr = request.getParameterValues("color");
		String[] stoneNameArr = request.getParameterValues("stoneName");
		String[] actualWeightArr = request.getParameterValues("actualWeight");
		String[] remarksArr = request.getParameterValues("remark");
		String wId = "0";
		for (int i = 0; i < colorArr.length; i++) {

			insertDate = new Date();
			String color = colorArr[i];
			String stoneName = stoneNameArr[i];
			String actualWeight = actualWeightArr[i];
			String remarks = remarksArr[i];

			if (!actualWeight.equalsIgnoreCase("")) {
				WorkHistoryBean workHistoryBean = new WorkHistoryBean(kapanName, lotName, actualWeight, stoneName,
						priority, color, clearity, insertDate, startDate, completinDate, "-", productMasterBean,
						customerBean, active, deactiveDate, "-", statusBean, remarks, userBean, in_stock, instockDate,
						0, parent_id, clearedDate, bundleNum);
				boolean result = allInsertDAO.workInsert(workHistoryBean, custId);
				wId = workHistoryBean.getWork_history_id();

				String[] splitData = PIDS.split(",");
				if (splitData.length != 0) {

					for (String s : splitData) {

						int p_id = Integer.parseInt(s);

						System.out.println("####==" + p_id);
						String customer_code = c.getCustomer_code();

						WorkHistoryBean w = new WorkHistoryBean();
						w.setWork_history_id(wId);

						ProductMasterBean p = new ProductMasterBean();
						p.setProduct_master_id(p_id);

						WorkProductBean workProductBean = new WorkProductBean(new Date(), customer_code, p, w, 1);
						boolean workProductInsert = allInsertDAO.workProductInsert(workProductBean, custId);
						String wpId = workProductBean.getWork_product_id();

						WorkProductBean wpb = new WorkProductBean();
						wpb.setWork_product_id(wpId);

						List<ProductProcessBean> listOfProcess = allListDAO.listOfProductProcess(p_id);

						for (ProductProcessBean psb : listOfProcess) {

							int psId = psb.getProduct_process_id();

							ProductProcessBean productProcessBean = new ProductProcessBean();
							productProcessBean.setProduct_process_id(psId);

							Date defaultDate = simpleDateFormat.parse("1900-01-01");

							WorkProductProcessBean workProductProcessBean = new WorkProductProcessBean(customer_code,
									new Date(), defaultDate, defaultDate, "-", "-", 1, "-", w, wpb, productProcessBean,
									kapanName, lotName, stoneName, psb.getProduct_process_name(), 1, actualWeight,
									priority, color, clearity);
							boolean workProductProcessInsert = allInsertDAO
									.workProductProcessInsert(workProductProcessBean, custId);
						}

					}

				}

				if (stoneNum != null) {
					if (!stoneNum.equalsIgnoreCase("")) {
						parent_id = wId;
						int scount = 0;

						try {
							scount = Integer.parseInt(stoneNum);
						} catch (Exception e) {
							// TODO: handle exception
						}

						if (scount != 0) {
							String[] aweight = request.getParameterValues("childWeight");

							for (String cWeight : aweight) {
								actualWeight = cWeight;
								workHistoryBean = new WorkHistoryBean(kapanName, lotName, actualWeight, stoneName,
										priority, color, clearity, insertDate, startDate, completinDate, "-",
										productMasterBean, customerBean, active, deactiveDate, "-", statusBean, remarks,
										userBean, in_stock, instockDate, 0, parent_id, clearedDate, bundleNum);
								result = allInsertDAO.workInsert(workHistoryBean, custId);
								wId = workHistoryBean.getWork_history_id();
								if (splitData.length != 0) {
									for (String s : splitData) {
										int p_id = Integer.parseInt(s);

										String customer_code = c.getCustomer_code();

										WorkHistoryBean w = new WorkHistoryBean();
										w.setWork_history_id(wId);

										ProductMasterBean p = new ProductMasterBean();
										p.setProduct_master_id(p_id);

										WorkProductBean workProductBean = new WorkProductBean(new Date(), customer_code,
												p, w, 1);
										boolean workProductInsert = allInsertDAO.workProductInsert(workProductBean,
												custId);
										String wpId = workProductBean.getWork_product_id();
										WorkProductBean wpb = new WorkProductBean();
										wpb.setWork_product_id(wpId);

										List<ProductProcessBean> listOfProcess = allListDAO.listOfProductProcess(p_id);

										for (ProductProcessBean psb : listOfProcess) {

											int psId = psb.getProduct_process_id();

											ProductProcessBean productProcessBean = new ProductProcessBean();
											productProcessBean.setProduct_process_id(psId);

											Date defaultDate = simpleDateFormat.parse("1900-01-01");

											WorkProductProcessBean workProductProcessBean = new WorkProductProcessBean(
													customer_code, new Date(), defaultDate, defaultDate, "-", "-", 1,
													"-", w, wpb, productProcessBean, kapanName, lotName, stoneName,
													psb.getProduct_process_name(), 1, actualWeight, priority, color,
													clearity);
											boolean workProductProcessInsert = allInsertDAO
													.workProductProcessInsert(workProductProcessBean, custId);
										}

									}

								}
							}

						}

					}
				}

			}
		}

		/* For Sync Work history */
		HttpSession session = request.getSession();
		String diamondSession = new EncodeDecode().encodeString("diamondSession");
		UserBean usession = (UserBean) session.getAttribute(diamondSession);
		final String custIdSession = String.valueOf(usession.getCustomer_id());
		new Thread(new Runnable() {
			public void run() {
				new sync().workHistorySync(custIdSession);
			}
		}).start();
		/* For Sync Work history */

		String encodeWork_id = new EncodeDecode().encodeString(String.valueOf(wId));
		response.sendRedirect("redirect?p=YWRkU3RvbmU=&wId=" + encodeWork_id);

		return null;
	}

	@RequestMapping(value = "/updateWork", method = RequestMethod.POST) // Mapping for Call the controller
	public String updateWork(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {

		String wId = request.getParameter("wId");
		int custId = Integer.parseInt(request.getParameter("custId"));
		String kapanName = request.getParameter("kapanName");
		String lotName = request.getParameter("lotName");
		String stoneName = request.getParameter("stoneName");
		String actualWeight = request.getParameter("actualWeight");
		String priority = request.getParameter("priority");
		String color = request.getParameter("color");
		String clearity = request.getParameter("clearity");
		String remarks = request.getParameter("remark");
		int pId = Integer.parseInt(request.getParameter("pId"));
		int uId = Integer.parseInt(request.getParameter("uId"));
		String stoneNum = request.getParameter("stoneNum");

		UserBean userBean = new UserBean();
		userBean.setUser_id(uId);

		int active = 1;

		WorkHistoryBean ww = allListDAO.workHistoryId(wId);
		String bundleNum = ww.getBundle_num();
		String parent_id = ww.getParent_work_id();

		CustomerBean c = allListDAO.customerDetails(custId);

		String PIDS = request.getParameter("PIDS");
		CustomerBean customerBean = new CustomerBean();
		ProductMasterBean productMasterBean = new ProductMasterBean();
		productMasterBean.setProduct_master_id(pId);
		customerBean.setCustomer_id(custId);

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date insertDate = new Date();
		Date startDate = simpleDateFormat.parse("1900-01-01");
		Date completinDate = simpleDateFormat.parse("1900-01-01");
		Date deactiveDate = simpleDateFormat.parse("1900-01-01");
		Date instockDate = simpleDateFormat.parse("1900-01-01");
		Date clearedDate = simpleDateFormat.parse("1900-01-01");

		int in_stock = 0;

		StatusBean statusBean = new StatusBean();
		statusBean.setStatus_id(1);

		WorkHistoryBean workHistoryBean = new WorkHistoryBean(wId, kapanName, lotName, actualWeight, stoneName,
				priority, color, clearity, insertDate, startDate, completinDate, "-", productMasterBean, customerBean,
				active, deactiveDate, "-", statusBean, remarks, userBean, in_stock, instockDate, 0, parent_id,
				clearedDate, bundleNum);
		boolean result = allUpdateDAO.workUpdate(workHistoryBean);

		boolean deactivateWorkProduct = allUpdateDAO.deactivateWorkProduct(wId, 0);
		boolean deactivateWorkProductProcess = allUpdateDAO.deactivateWorkProductProcess(wId, 0);

		String[] splitData = PIDS.split(",");
		if (splitData.length != 0) {

			for (String s : splitData) {

				int p_id = Integer.parseInt(s);

				String customer_code = c.getCustomer_code();

				WorkHistoryBean w = new WorkHistoryBean();
				w.setWork_history_id(wId);

				ProductMasterBean p = new ProductMasterBean();
				p.setProduct_master_id(p_id);

				WorkProductBean workProductBean = new WorkProductBean(new Date(), customer_code, p, w, 1);
				boolean workProductInsert = allInsertDAO.workProductInsert(workProductBean, custId);
				String wpId = workProductBean.getWork_product_id();
				WorkProductBean wpb = new WorkProductBean();
				wpb.setWork_product_id(wpId);

				List<ProductProcessBean> listOfProcess = allListDAO.listOfProductProcess(p_id);

				for (ProductProcessBean psb : listOfProcess) {

					int psId = psb.getProduct_process_id();

					ProductProcessBean productProcessBean = new ProductProcessBean();
					productProcessBean.setProduct_process_id(psId);
					Date defaultDate = simpleDateFormat.parse("1900-01-01");
					WorkProductProcessBean workProductProcessBean = new WorkProductProcessBean(customer_code,
							new Date(), defaultDate, defaultDate, "-", "-", 1, "-", w, wpb, productProcessBean,
							kapanName, lotName, stoneName, psb.getProduct_process_name(), 1, actualWeight, priority,
							color, clearity);
					boolean workProductProcessInsert = allInsertDAO.workProductProcessInsert(workProductProcessBean,
							custId);
				}

			}

		}

		String[] cwIdArray = request.getParameterValues("cwId");
		String[] childWeightOrigArray = request.getParameterValues("childWeightOrig");
		parent_id = wId;
		if (childWeightOrigArray != null) {
			for (int i = 0; i < cwIdArray.length; i++) {
				wId = cwIdArray[i];
				actualWeight = childWeightOrigArray[i];

				System.out.println(wId + "----" + actualWeight);

				workHistoryBean = new WorkHistoryBean(wId, kapanName, lotName, actualWeight, stoneName, priority, color,
						clearity, insertDate, startDate, completinDate, "-", productMasterBean, customerBean, active,
						deactiveDate, "-", statusBean, remarks, userBean, in_stock, instockDate, 0, parent_id,
						clearedDate, bundleNum);
				result = allUpdateDAO.workUpdate(workHistoryBean);

				deactivateWorkProduct = allUpdateDAO.deactivateWorkProduct(wId, 0);
				deactivateWorkProductProcess = allUpdateDAO.deactivateWorkProductProcess(wId, 0);

				if (splitData.length != 0) {

					for (String s : splitData) {

						int p_id = Integer.parseInt(s);

						String customer_code = c.getCustomer_code();

						WorkHistoryBean w = new WorkHistoryBean();
						w.setWork_history_id(wId);

						ProductMasterBean p = new ProductMasterBean();
						p.setProduct_master_id(p_id);

						WorkProductBean workProductBean = new WorkProductBean(new Date(), customer_code, p, w, 1);
						boolean workProductInsert = allInsertDAO.workProductInsert(workProductBean, custId);
						String wpId = workProductBean.getWork_product_id();
						WorkProductBean wpb = new WorkProductBean();
						wpb.setWork_product_id(wpId);

						List<ProductProcessBean> listOfProcess = allListDAO.listOfProductProcess(p_id);

						for (ProductProcessBean psb : listOfProcess) {

							int psId = psb.getProduct_process_id();

							ProductProcessBean productProcessBean = new ProductProcessBean();
							productProcessBean.setProduct_process_id(psId);
							Date defaultDate = simpleDateFormat.parse("1900-01-01");
							WorkProductProcessBean workProductProcessBean = new WorkProductProcessBean(customer_code,
									new Date(), defaultDate, defaultDate, "-", "-", 1, "-", w, wpb, productProcessBean,
									kapanName, lotName, stoneName, psb.getProduct_process_name(), 1, actualWeight,
									priority, color, clearity);
							boolean workProductProcessInsert = allInsertDAO
									.workProductProcessInsert(workProductProcessBean, custId);
						}

					}

				}
			}

		}

		if (stoneNum != null) {
			if (!stoneNum.equalsIgnoreCase("")) {
				int scount = 0;

				try {
					scount = Integer.parseInt(stoneNum);
				} catch (Exception e) {
					// TODO: handle exception
				}

				if (scount != 0) {
					String[] aweight = request.getParameterValues("childWeight");

					for (String cWeight : aweight) {

						actualWeight = cWeight;
						workHistoryBean = new WorkHistoryBean(kapanName, lotName, actualWeight, stoneName, priority,
								color, clearity, insertDate, startDate, completinDate, "-", productMasterBean,
								customerBean, active, deactiveDate, "-", statusBean, remarks, userBean, in_stock,
								instockDate, 0, parent_id, clearedDate, bundleNum);
						result = allInsertDAO.workInsert(workHistoryBean, custId);
						wId = workHistoryBean.getWork_history_id();
						if (splitData.length != 0) {
							for (String s : splitData) {
								int p_id = Integer.parseInt(s);

								String customer_code = c.getCustomer_code();

								WorkHistoryBean w = new WorkHistoryBean();
								w.setWork_history_id(wId);

								ProductMasterBean p = new ProductMasterBean();
								p.setProduct_master_id(p_id);

								WorkProductBean workProductBean = new WorkProductBean(new Date(), customer_code, p, w,
										1);
								boolean workProductInsert = allInsertDAO.workProductInsert(workProductBean, custId);
								String wpId = workProductBean.getWork_product_id();
								WorkProductBean wpb = new WorkProductBean();
								wpb.setWork_product_id(wpId);

								List<ProductProcessBean> listOfProcess = allListDAO.listOfProductProcess(p_id);

								for (ProductProcessBean psb : listOfProcess) {

									int psId = psb.getProduct_process_id();

									System.out.println("====" + psId);

									ProductProcessBean productProcessBean = new ProductProcessBean();
									productProcessBean.setProduct_process_id(psId);

									Date defaultDate = simpleDateFormat.parse("1900-01-01");

									WorkProductProcessBean workProductProcessBean = new WorkProductProcessBean(
											customer_code, new Date(), defaultDate, defaultDate, "-", "-", 1, "-", w,
											wpb, productProcessBean, kapanName, lotName, stoneName,
											psb.getProduct_process_name(), 1, actualWeight, priority, color, clearity);
									boolean workProductProcessInsert = allInsertDAO
											.workProductProcessInsert(workProductProcessBean, custId);
								}

							}

						}
					}

				}

			}
		}

		/* For Sync Work history */
		HttpSession session = request.getSession();
		String diamondSession = new EncodeDecode().encodeString("diamondSession");
		UserBean usession = (UserBean) session.getAttribute(diamondSession);
		final String custIdSession = String.valueOf(usession.getCustomer_id());
		new Thread(new Runnable() {
			public void run() {
				new sync().workHistorySync(custIdSession);
			}
		}).start();
		/* For Sync Work history */

		response.sendRedirect("redirect?p=Y2hhbGxhbk1hc3Rlcg==");

		return null;
	}

	@RequestMapping(value = "/deactiveWorkHistory", method = RequestMethod.GET) // Mapping for Call the controller
	public String deactiveWorkHistory(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String wId = request.getParameter("wId");

		System.out.println("=====" + wId);
		int active = 0;

		boolean result = allUpdateDAO.deactivateWorkHistory(wId, active);

		System.out.println(result);
		response.sendRedirect("redirect?p=Y2hhbGxhbk1hc3Rlcg==");

		return null;
	}

	@RequestMapping(value = "/detailsOfWorkHistory", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String detailsOfWorkHistory(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String wId = request.getParameter("wId");

		// Call the method for get details of Specification Of Field Detail
		WorkHistoryBean workHistoryBean = allListDAO.workHistoryId(wId);

		// This is use for convert data into json format
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(workHistoryBean);

		return jsonArray;
	}

	@RequestMapping(value = "/productProcessInsert", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String productProcessInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		String processName = request.getParameter("processName");
		int active = 1;

		ProductMasterBean productMasterBean = new ProductMasterBean();
		productMasterBean.setProduct_master_id(p_id);
		ProductProcessBean productProcessBean = new ProductProcessBean(processName, active, new Date(),
				productMasterBean);

		AllInsertDAO allInsertDAO = new AllInsertDAO();
		boolean result = allInsertDAO.productProcessInsert(productProcessBean);

		return null;
	}

	@RequestMapping(value = "/listOfProcessByProductId", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String listOfProcessByProductId(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		int pId = Integer.parseInt(request.getParameter("pId"));

		// Call the method for get details of Specification Of Field Detail
		List<ProductProcessBean> listOfProcess = allListDAO.listOfProductProcess(pId);

		// This is use for convert data into json format
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(listOfProcess);

		return jsonArray;
	}

	@RequestMapping(value = "/productProcessDelete", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String productProcessDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int ppId = Integer.parseInt(request.getParameter("ppId"));
		int active = 0;

		// Call the method for get details of Specification Of Field Detail
		boolean result = allUpdateDAO.deactivateProcess(ppId, active);

		return null;
	}

	@RequestMapping(value = "/productProcessDetails", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String productProcessDetails(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int ppId = Integer.parseInt(request.getParameter("ppId"));

		// Call the method for get details of Specification Of Field Detail
		ProductProcessBean productProcessBean = allListDAO.detailsOfProcess(ppId);

		// This is use for convert data into json format
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(productProcessBean);

		return jsonArray;
	}

	@RequestMapping(value = "/productProcessUpdate", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String productProcessUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pp_id = Integer.parseInt(request.getParameter("pp_id"));
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		String processName = request.getParameter("processName");
		int active = 1;

		ProductMasterBean productMasterBean = new ProductMasterBean();
		productMasterBean.setProduct_master_id(p_id);
		ProductProcessBean productProcessBean = new ProductProcessBean(pp_id, processName, active, new Date(),
				productMasterBean);

		AllInsertDAO allInsertDAO = new AllInsertDAO();
		boolean result = allUpdateDAO.productProcessUpdate(productProcessBean);

		return null;
	}

	@RequestMapping(value = "/customerProductInsert", method = RequestMethod.POST) // Mapping for Call the controller
	public String customerProductInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int cId = Integer.parseInt(request.getParameter("cId"));
		int uId = Integer.parseInt(request.getParameter("uId"));
		int pId = Integer.parseInt(request.getParameter("pId"));
		int active = 1;

		String[] machineNumber = request.getParameterValues("mNumber");
		String[] machineSize = request.getParameterValues("mSize");

		CustomerBean customerBean = new CustomerBean();
		UserBean userBean = new UserBean();
		ProductMasterBean productMasterBean = new ProductMasterBean();

		customerBean.setCustomer_id(cId);
		userBean.setUser_id(uId);
		productMasterBean.setProduct_master_id(pId);

		AllInsertDAO allInsertDAO = new AllInsertDAO();

		for (int i = 0; i < machineNumber.length; i++) {
			String mNumber = machineNumber[i];
			String mSize = machineSize[i];

			CustomerProductBean customerProductBean = new CustomerProductBean(mNumber, mSize, active, new Date(),
					productMasterBean, customerBean, userBean);
			boolean result = allInsertDAO.customerProductInsert(customerProductBean);
		}

		String encodeCust_id = new EncodeDecode().encodeString(String.valueOf(cId));

		response.sendRedirect("redirect?p=Y3VzdG9tZXJQcm9kdWN0=&cId=" + encodeCust_id);
		return null;
	}

	@RequestMapping(value = "/customerProductList", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String customerProductList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int cId = Integer.parseInt(request.getParameter("cId"));
		int pId = Integer.parseInt(request.getParameter("pId"));

		List<CustomerProductBean> listOfProductByProductId = allListDAO.listOfCustomerProduct(cId, pId);

		// This is use for convert data into json format
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(listOfProductByProductId);

		return jsonArray;
	}

	@RequestMapping(value = "/customerProductDeactivate", method = RequestMethod.POST) // Mapping for Call the
																						// controller
	@ResponseBody // for return specific value
	public String customerProductDeactivate(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		int cpId = Integer.parseInt(request.getParameter("cpId"));
		int active = 0;

		boolean result = allUpdateDAO.deactivateCustomerProduct(cpId, active);

		return null;
	}

	@RequestMapping(value = "/deactivateActivateUser", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String deactivateActivateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int auth = Integer.parseInt(request.getParameter("authority"));

		boolean result = allUpdateDAO.deactivateActivateUser(user_id, auth);

		return null;
	}

	@RequestMapping(value = "/detailsOfCustomerTypeMaster", method = RequestMethod.POST) // Mapping for Call the
																							// controller
	@ResponseBody // for return specific value
	public String detailsOfCustomerTypeMaster(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		int ctId = Integer.parseInt(request.getParameter("ctId"));

		// Call the method for get details of Specification Of Field Detail
		CustomerTypeBean customerTypeBean = allListDAO.detailsOfCustomerType(ctId);

		// This is use for convert data into json format
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(customerTypeBean);

		return jsonArray;
	}

	@RequestMapping(value = "/updateCutomerTypeMaster", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String updateCutomerTypeMaster(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int ctId = Integer.parseInt(request.getParameter("ctId"));
		int user_id = Integer.parseInt(request.getParameter("user_id"));

		String type = request.getParameter("type");
		String name = request.getParameter("name");
		String description = request.getParameter("description");

		UserBean userBean = new UserBean();
		userBean.setUser_id(user_id);

		CustomerTypeBean customerTypeBean = new CustomerTypeBean(ctId, type, name, description, new Date(), 1,
				userBean);
		boolean resultUpdate = allUpdateDAO.customerTypeMasterUpdate(customerTypeBean);

		response.sendRedirect("redirect?p=Y3VzdG9tZXJUeXBlTWFzdGVy");

		return null;
	}

	@RequestMapping(value = "/addRateCriteria", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody // for return specific value
	public String addRateCriteria(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {
		int ctId = Integer.parseInt(request.getParameter("ctId"));
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int userCutsId = Integer.parseInt(request.getParameter("userCutsId"));
		int pId = Integer.parseInt(request.getParameter("pId"));

		double sizeFrom = Double.parseDouble(request.getParameter("sizeFrom"));
		double sizeTo = Double.parseDouble(request.getParameter("sizeTo"));
		double rate = Double.parseDouble(request.getParameter("rate"));
		double sltlShare = Double.parseDouble(request.getParameter("sltlShare"));
		double minRate = Double.parseDouble(request.getParameter("minRate"));

		double rateStone = Double.parseDouble(request.getParameter("rateStone"));
		double minRateStone = Double.parseDouble(request.getParameter("minRateStone"));

		String date = request.getParameter("date");
		String name = sizeFrom + " - " + sizeTo;
		int status = 1;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date parseDate = simpleDateFormat.parse(date);

		UserBean userBean = new UserBean();
		userBean.setUser_id(user_id);
		CustomerTypeBean customerTypeBean = new CustomerTypeBean();
		customerTypeBean.setCustomer_type_id(ctId);
		ProductMasterBean productMasterBean = new ProductMasterBean();
		productMasterBean.setProduct_master_id(pId);

		RateCriteriaBean rateCriteriaBean = new RateCriteriaBean(sizeFrom, sizeTo, 0, 0, rate, parseDate, new Date(),
				userBean, customerTypeBean, name, status, userCutsId, productMasterBean, sltlShare, 0, minRate,
				rateStone, minRateStone);
		boolean resultInsert = allInsertDAO.rateCriteriaInsert(rateCriteriaBean, userCutsId);

		String encodeCtId = new EncodeDecode().encodeString(String.valueOf(ctId));
		String encodeCustId = new EncodeDecode().encodeString(String.valueOf(userCutsId));

		if (request.getParameter("redirect") != null) {
			String redirectLink = request.getParameter("redirect");
			response.sendRedirect(redirectLink);
		} else {
			response.sendRedirect("redirect?p=cmF0ZUNyaXRlcmlh&ct_id=" + encodeCtId + "&cId=" + encodeCustId);
		}

		return null;
	}

	@RequestMapping(value = "/addRateCriteriaForSubCustomer", method = RequestMethod.POST) // Mapping for Call the
																							// controller
	@ResponseBody // for return specific value
	public String addRateCriteriaForSubCustomer(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {
		int ctId = Integer.parseInt(request.getParameter("ctId"));
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int userCutsId = Integer.parseInt(request.getParameter("userCutsId"));
		int pId = Integer.parseInt(request.getParameter("pId"));

		double sizeFrom = Double.parseDouble(request.getParameter("sizeFrom"));
		double sizeTo = Double.parseDouble(request.getParameter("sizeTo"));
		double rate = Double.parseDouble(request.getParameter("rate"));
		double sltlShare = Double.parseDouble(request.getParameter("sltlShare"));
		double minRate = Double.parseDouble(request.getParameter("minRate"));

		double rateStone = Double.parseDouble(request.getParameter("rateStone"));
		double minRateStone = Double.parseDouble(request.getParameter("minRateStone"));

		String date = request.getParameter("date");
		String name = sizeFrom + " - " + sizeTo;
		int status = 1;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date parseDate = simpleDateFormat.parse(date);

		UserBean userBean = new UserBean();
		userBean.setUser_id(user_id);
		CustomerTypeBean customerTypeBean = new CustomerTypeBean();
		customerTypeBean.setCustomer_type_id(ctId);
		ProductMasterBean productMasterBean = new ProductMasterBean();
		productMasterBean.setProduct_master_id(pId);

		RateCriteriaBean rateCriteriaBean = new RateCriteriaBean(sizeFrom, sizeTo, 0, 0, rate, parseDate, new Date(),
				userBean, customerTypeBean, name, status, userCutsId, productMasterBean, sltlShare, 0, minRate,
				rateStone, minRateStone);
		boolean resultInsert = allInsertDAO.rateCriteriaInsert(rateCriteriaBean, userCutsId);

		String encodeCtId = new EncodeDecode().encodeString(String.valueOf(ctId));
		String encodeCustId = new EncodeDecode().encodeString(String.valueOf(userCutsId));
		String encodeProdId = new EncodeDecode().encodeString(String.valueOf(pId));

		if (request.getParameter("redirect") != null) {
			String redirectLink = request.getParameter("redirect");
			response.sendRedirect(redirectLink);
		} else {
			response.sendRedirect("redirect?p=cmF0ZUNhcml0ZXJpYUZvclN1YkN1c3RvbWVy&ct_id=" + encodeCtId + "&cId="
					+ encodeCustId + "&pId=" + encodeProdId);
		}

		return null;
	}

	@RequestMapping(value = "/listOfPendingChallans", method = RequestMethod.POST) // Mapping for Call the controller
	public String listOfPendingChallans(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {
		int custId = Integer.parseInt(request.getParameter("custId"));
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");

		String parseFromDate = "";
		String parseToDate = "";

		SimpleDateFormat yyyymmdd = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat ddmmyyyy = new SimpleDateFormat("dd/MM/yyyy");

		List<WorkHistoryBean> listOfWork = null;
		if (!fromDate.equalsIgnoreCase("") && !toDate.equalsIgnoreCase("")) {

			parseFromDate = yyyymmdd.format(ddmmyyyy.parse(fromDate));
			parseToDate = yyyymmdd.format(ddmmyyyy.parse(toDate));

			listOfWork = allListDAO.listOfWorkHistoryByCustomerId(custId, parseFromDate, parseToDate);

		} else {
			System.out.println(custId);
			listOfWork = allListDAO.listOfWorkHistoryByCustomerId(custId, parseFromDate, parseToDate);
		}

		request.setAttribute("listOfPendingChallans", listOfWork);

		String page = "Z2VuZXJhdGVCaWxs";
		String decodeText = new EncodeDecode().decodeString(page);

		return decodeText;
	}

	@RequestMapping(value = "/generateBill", method = RequestMethod.POST) // Mapping for Call the controller
	public String generateBill(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {
		String[] wids = request.getParameterValues("wId");
		int custId = Integer.parseInt(request.getParameter("custId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		int userCustId = Integer.parseInt(request.getParameter("userCustId"));

		CustomerBean customerBean = allListDAO.customerDetails(custId);

		CustomerBean UsercustomerBean = allListDAO.customerDetails(userCustId);

		String invSeq = UsercustomerBean.getInvoice_seq();

		String customer_code = customerBean.getCustomer_code();
		String main_customer_code = customerBean.getParent_customer_code();
		int parent_customer_id = customerBean.getParent_customer_id();
		CustomerBean parentCust = allListDAO.customerDetails(parent_customer_id);

		double vatRate = parentCust.getVat_rate();

		double cgst = customerBean.getCgst();
		double sgst = customerBean.getSgst();
		double igst = customerBean.getIgst();

		userCustId = parent_customer_id;

		UserBean userBean = new UserBean();
		userBean.setUser_id(userId);

		String invoiceid = "0";
		String sInvoiceid = "0";
		String error = "";
		int posting = 0;
		int postingBy = 0;

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date postinDate = simpleDateFormat.parse("1900/01/01");

		int billed = 0;
		String bill_ref = "-";
		Date billedDate = simpleDateFormat.parse("1900/01/01");

		if (request.getParameterValues("wId") != null) {
			boolean flag = false;

			/*
			 * for (String ss : wids) { String wId1 = ss;
			 * 
			 * List<WorkHistoryBean> listOfChildWork =
			 * allListDAO.listOfWorkHistoryByParentWorkId(wId1);
			 * 
			 * if (listOfChildWork.size() == 0) { WorkHistoryBean workHistoryBean1 =
			 * allListDAO.workHistoryId(wId1); String date1 =
			 * simpleDateFormat.format(workHistoryBean1.getInsert_date()); double carat1 =
			 * Double.parseDouble(workHistoryBean1.getActual_weight());
			 * List<WorkProductBean> listofWorkProduct1 =
			 * allListDAO.listOfWorkProduct(wId1); for (WorkProductBean w1 :
			 * listofWorkProduct1) { int prod_id1 =
			 * w1.getProductMasterBean().getProduct_master_id();
			 * 
			 * CustomerProductRateBean customerProductRateBean = allListDAO
			 * .detailsOfCustomerProductRateByCustId(custId, prod_id1);
			 * 
			 * if (customerProductRateBean != null) {
			 * 
			 * int pid =
			 * customerProductRateBean.getProductMasterBean().getProduct_master_id(); int
			 * custType =
			 * customerProductRateBean.getCustomerTypeBean().getCustomer_type_id();
			 * 
			 * List<WorkProductProcessBean> listOfProcessByProdId = allListDAO
			 * .listOfWorkProductProcessByProduct(pid, custId);
			 * 
			 * double criteria = 0;
			 * 
			 * if (custType == 1) { criteria = carat1; } else if (custType == 2) { criteria
			 * = listOfProcessByProdId.size(); }
			 * 
			 * RateCriteriaBean rateCriteriaBean = allListDAO.findRateOfCarat(custType,
			 * criteria, custId, prod_id1, date1);
			 * 
			 * if (rateCriteriaBean == null) { flag = true; }
			 * 
			 * } System.err.println("====" + flag); } } else { for (WorkHistoryBean www :
			 * listOfChildWork) { wId1 = www.getWork_history_id(); WorkHistoryBean
			 * workHistoryBean1 = allListDAO.workHistoryId(wId1); String date1 =
			 * simpleDateFormat.format(workHistoryBean1.getInsert_date()); double carat1 =
			 * Double.parseDouble(workHistoryBean1.getActual_weight());
			 * List<WorkProductBean> listofWorkProduct1 =
			 * allListDAO.listOfWorkProduct(wId1); for (WorkProductBean w1 :
			 * listofWorkProduct1) { int prod_id1 =
			 * w1.getProductMasterBean().getProduct_master_id();
			 * 
			 * CustomerProductRateBean customerProductRateBean = allListDAO
			 * .detailsOfCustomerProductRateByCustId(custId, prod_id1);
			 * 
			 * if (customerProductRateBean != null) { int pid =
			 * customerProductRateBean.getProductMasterBean().getProduct_master_id(); int
			 * custType =
			 * customerProductRateBean.getCustomerTypeBean().getCustomer_type_id();
			 * 
			 * List<WorkProductProcessBean> listOfProcessByProdId = allListDAO
			 * .listOfWorkProductProcessByProduct(pid, custId);
			 * 
			 * double criteria = 0;
			 * 
			 * if (custType == 1) { criteria = carat1; } else if (custType == 2) { criteria
			 * = listOfProcessByProdId.size(); }
			 * 
			 * RateCriteriaBean rateCriteriaBean = allListDAO.findRateOfCarat(custType,
			 * criteria, custId, prod_id1, date1);
			 * 
			 * if (rateCriteriaBean == null) { flag = true; } } System.err.println("====" +
			 * flag); } } }
			 * 
			 * }
			 */

			System.err.println("====" + flag);

			if (flag == false) {

				double totalcarat = 0;
				double totalOutStanding = 0;
				double totalSltlOutStanding = 0;

				long maxNumber = allCountDAO.getlastNumberOfInvoiceByCustomer(userCustId);
				maxNumber = maxNumber + 1;

				String invoice_num = String.valueOf(maxNumber);

				invoice_num = invSeq + invoice_num;

				long maxNumbersltl = allCountDAO.getlastNumberOfSltlInvoiceByCustomer(userCustId);
				maxNumbersltl = maxNumbersltl + 1;
				String sltl_invoice_num = "SLT_" + String.valueOf(maxNumbersltl);

				double discount_per = 0;
				double discount_amount = 0;
				double final_outstanding = totalOutStanding - discount_amount;

				String currencyType = "USD";
				double conversion = 1;
				int active = 1;

				CustomerTypeBean customerTypeBean = new CustomerTypeBean();
				SltlinvoiceBean sIBean = new SltlinvoiceBean();
				InvoiceBean iBean = new InvoiceBean();

				for (String s : wids) {

					String wId = s;
					List<WorkHistoryBean> listOfChildWork = allListDAO.listOfWorkHistoryByParentWorkId(wId);
					System.out.println(listOfChildWork.size() + "-------------------");
					if (listOfChildWork.size() == 0) {

						WorkHistoryBean workHistoryBean = allListDAO.workHistoryId(wId);
						String date = simpleDateFormat.format(workHistoryBean.getInsert_date());

						List<Integer> listofWorkProduct = allListDAO.listOfWorkProductGroupBy(wId);

						double carat = Double.parseDouble(workHistoryBean.getActual_weight());
						totalcarat = totalcarat + carat;

						for (int prodId : listofWorkProduct) {

							int prod_id = prodId;

							CustomerProductRateBean customerProductRateBean = allListDAO
									.detailsOfCustomerProductRateByCustId(custId, prod_id);

							if (customerProductRateBean != null) {

								int pid = customerProductRateBean.getProductMasterBean().getProduct_master_id();
								int custType = customerProductRateBean.getCustomerTypeBean().getCustomer_type_id();

								List<WorkProductProcessBean> listOfProcessByProdId = allListDAO
										.listOfWorkProductProcessByProduct(pid, custId);

								double criteria = 0;

								if (custType == 1) {
									criteria = carat;
								} else if (custType == 2) {
									criteria = listOfProcessByProdId.size();
								}

								System.err.println(custType);
								double discount = customerProductRateBean.getDiscount();
								customerTypeBean.setCustomer_type_id(custType);

								if (invoiceid.equalsIgnoreCase("0")) {
									InvoiceBean invoiceBean = new InvoiceBean(invoice_num, new Date(), new Date(),
											totalOutStanding, discount_per, discount_amount, final_outstanding,
											customer_code, main_customer_code, customerBean, userBean, customerTypeBean,
											currencyType, conversion, posting, postinDate, postingBy, vatRate, cgst,
											sgst, igst, billed, billedDate, bill_ref);
									boolean insertInvoice = allInsertDAO.invoiceInsert(invoiceBean, userCustId);
									invoiceid = invoiceBean.getInvoice_id();
									iBean.setInvoice_id(invoiceid);
								} else {
									InvoiceBean invoiceBean = new InvoiceBean(invoiceid, invoice_num, new Date(),
											new Date(), totalOutStanding, discount_per, discount_amount,
											final_outstanding, customer_code, main_customer_code, customerBean,
											userBean, customerTypeBean, currencyType, conversion, posting, postinDate,
											postingBy, vatRate, cgst, sgst, igst, billed, billedDate, bill_ref);
									boolean updateInvoice = allUpdateDAO.invoiceUpdate(invoiceBean);
								}

								if (sInvoiceid.equalsIgnoreCase("0")) {
									System.out.println("====" + iBean.getInvoice_id());
									SltlinvoiceBean sltlinvoiceBean = new SltlinvoiceBean(sltl_invoice_num, new Date(),
											totalSltlOutStanding, 0, 0, totalSltlOutStanding, userBean, iBean,
											currencyType, conversion);
									boolean insertSltlInvoice = allInsertDAO.sltlInvoiceInsert(sltlinvoiceBean,
											userCustId);
									sInvoiceid = sltlinvoiceBean.getSltl_invoice_id();
									sIBean.setSltl_invoice_id(sInvoiceid);
								} else {
									System.out.println("====" + iBean.getInvoice_id());
									SltlinvoiceBean sltlinvoiceBean = new SltlinvoiceBean(sInvoiceid, sltl_invoice_num,
											new Date(), totalSltlOutStanding, 0, 0, totalSltlOutStanding, userBean,
											iBean, currencyType, conversion);
									boolean updateSltlInvoice = allUpdateDAO.sltlInvoiceUpdate(sltlinvoiceBean);
								}

								ProductMasterBean p = new ProductMasterBean();
								p.setProduct_master_id(prod_id);

								RateCriteriaBean rateCriteriaBean = allListDAO.findRateOfCarat(custType, criteria,
										custId, prod_id, date);

								if (rateCriteriaBean != null) {

									double rate = rateCriteriaBean.getRate();
									double minrate = rateCriteriaBean.getMin_rate();
									double perStoneRate = 0;

									if (rate == 0) {
										rate = rateCriteriaBean.getRate_per_stone();
										minrate = rateCriteriaBean.getMin_rate_per_stone();
									}

									int minrateflag = 0;
									if (discount != 0) {
										double disAmount = (rate * discount / 100);
										rate = rate - disAmount;
										discount_amount = discount_amount + disAmount;
									}

									if (minrate > rate) {
										rate = minrate;
										minrateflag = 1;
									}

									perStoneRate = rate;

									if (rateCriteriaBean.getRate() != 0) {
										rate = rate * carat;
									}

									double sltlMargine = rateCriteriaBean.getSltl_share();
									totalOutStanding = totalOutStanding + rate;

									double sltlMarginAmt = (rate * sltlMargine) / 100;
									totalSltlOutStanding = totalSltlOutStanding + sltlMarginAmt;

									InvoiceLineBean invoiceLineBean = new InvoiceLineBean(String.valueOf(carat), rate,
											new Date(), workHistoryBean, iBean, userBean, p, minrateflag, active,
											perStoneRate);
									boolean insertInvoiceLine = allInsertDAO.invoiceLineInsert(invoiceLineBean,
											userCustId);

									InvoiceLineBean il = new InvoiceLineBean();
									il.setInvoice_line_id(invoiceLineBean.getInvoice_line_id());

									SltlInvoiceLineBean sltlInvoiceLineBean = new SltlInvoiceLineBean(sltlMargine,
											sltlMarginAmt, new Date(), invoiceLineBean, userBean, sIBean, active);
									boolean insertSltlInvoiceLine = allInsertDAO
											.sltlinvoiceLineInsert(sltlInvoiceLineBean, userCustId);

								} else {

									error = error + "/n Missing criteria for stone" + workHistoryBean.getStone_name();
								}

							}

						}

					} else {

						for (WorkHistoryBean www : listOfChildWork) {

							wId = www.getWork_history_id();

							System.out.println("=========" + wId);

							WorkHistoryBean workHistoryBean = allListDAO.workHistoryId(wId);
							String date = simpleDateFormat.format(workHistoryBean.getInsert_date());

							List<WorkProductBean> listofWorkProduct = allListDAO.listOfWorkProduct(wId);

							double carat = Double.parseDouble(workHistoryBean.getActual_weight());
							totalcarat = totalcarat + carat;

							for (WorkProductBean w : listofWorkProduct) {

								int prod_id = w.getProductMasterBean().getProduct_master_id();
								// int prod_id = 1101;
								System.err.println("================" + prod_id);

								CustomerProductRateBean customerProductRateBean = allListDAO
										.detailsOfCustomerProductRateByCustId(custId, prod_id);

								System.out.println(customerProductRateBean);

								if (customerProductRateBean != null) {

									int pid = customerProductRateBean.getProductMasterBean().getProduct_master_id();
									int custType = customerProductRateBean.getCustomerTypeBean().getCustomer_type_id();

									List<WorkProductProcessBean> listOfProcessByProdId = allListDAO
											.listOfWorkProductProcessByProduct(pid, custId);

									double criteria = 0;

									if (custType == 1) {
										criteria = carat;
									} else if (custType == 2) {
										criteria = listOfProcessByProdId.size();
									}

									double discount = customerProductRateBean.getDiscount();
									customerTypeBean.setCustomer_type_id(custType);

									if (invoiceid.equalsIgnoreCase("0")) {
										InvoiceBean invoiceBean = new InvoiceBean(invoice_num, new Date(), new Date(),
												totalOutStanding, discount_per, discount_amount, final_outstanding,
												customer_code, main_customer_code, customerBean, userBean,
												customerTypeBean, currencyType, conversion, posting, postinDate,
												postingBy, vatRate, cgst, sgst, igst, billed, billedDate, bill_ref);
										boolean insertInvoice = allInsertDAO.invoiceInsert(invoiceBean, userCustId);
										invoiceid = invoiceBean.getInvoice_id();
										iBean.setInvoice_id(invoiceid);
									} else {
										InvoiceBean invoiceBean = new InvoiceBean(invoiceid, invoice_num, new Date(),
												new Date(), totalOutStanding, discount_per, discount_amount,
												final_outstanding, customer_code, main_customer_code, customerBean,
												userBean, customerTypeBean, currencyType, conversion, posting,
												postinDate, postingBy, vatRate, cgst, sgst, igst, billed, billedDate,
												bill_ref);
										boolean updateInvoice = allUpdateDAO.invoiceUpdate(invoiceBean);
									}

									if (sInvoiceid.equalsIgnoreCase("0")) {
										SltlinvoiceBean sltlinvoiceBean = new SltlinvoiceBean(sltl_invoice_num,
												new Date(), totalSltlOutStanding, 0, 0, totalSltlOutStanding, userBean,
												iBean, currencyType, conversion);
										boolean insertSltlInvoice = allInsertDAO.sltlInvoiceInsert(sltlinvoiceBean,
												userCustId);
										sInvoiceid = sltlinvoiceBean.getSltl_invoice_id();
										sIBean.setSltl_invoice_id(sInvoiceid);
									} else {
										SltlinvoiceBean sltlinvoiceBean = new SltlinvoiceBean(sInvoiceid,
												sltl_invoice_num, new Date(), totalSltlOutStanding, 0, 0,
												totalSltlOutStanding, userBean, iBean, currencyType, conversion);
										boolean updateSltlInvoice = allUpdateDAO.sltlInvoiceUpdate(sltlinvoiceBean);
									}

									ProductMasterBean p = new ProductMasterBean();
									p.setProduct_master_id(prod_id);

									RateCriteriaBean rateCriteriaBean = allListDAO.findRateOfCarat(custType, criteria,
											custId, prod_id, date);

									if (rateCriteriaBean != null) {

										double rate = rateCriteriaBean.getRate();
										double minrate = rateCriteriaBean.getMin_rate();
										double perStoneRate = 0;

										if (rate == 0) {
											rate = rateCriteriaBean.getRate_per_stone();
											minrate = rateCriteriaBean.getMin_rate_per_stone();
										}

										int minrateflag = 0;

										if (discount != 0) {
											double disAmount = (rate * discount / 100);
											rate = rate - disAmount;
											discount_amount = discount_amount + disAmount;
										}

										if (minrate > rate) {
											rate = minrate;
											minrateflag = 1;
										}

										perStoneRate = rate;

										if (rateCriteriaBean.getRate() != 0) {
											rate = rate * carat;
										}

										double sltlMargine = rateCriteriaBean.getSltl_share();
										totalOutStanding = totalOutStanding + rate;

										double sltlMarginAmt = (rate * sltlMargine) / 100;
										totalSltlOutStanding = totalSltlOutStanding + sltlMarginAmt;

										InvoiceLineBean invoiceLineBean = new InvoiceLineBean(String.valueOf(carat),
												rate, new Date(), workHistoryBean, iBean, userBean, p, minrateflag,
												active, perStoneRate);
										boolean insertInvoiceLine = allInsertDAO.invoiceLineInsert(invoiceLineBean,
												userCustId);

										InvoiceLineBean il = new InvoiceLineBean();
										il.setInvoice_line_id(invoiceLineBean.getInvoice_line_id());

										SltlInvoiceLineBean sltlInvoiceLineBean = new SltlInvoiceLineBean(sltlMargine,
												sltlMarginAmt, new Date(), invoiceLineBean, userBean, sIBean, active);
										boolean insertSltlInvoiceLine = allInsertDAO
												.sltlinvoiceLineInsert(sltlInvoiceLineBean, userCustId);

									}

								}

							}
						}

					}

				}

				final_outstanding = totalOutStanding - discount_amount;

				InvoiceBean invoiceBean = new InvoiceBean(invoiceid, invoice_num, new Date(), new Date(),
						totalOutStanding, discount_per, discount_amount, final_outstanding, customer_code,
						main_customer_code, customerBean, userBean, customerTypeBean, currencyType, conversion, posting,
						postinDate, postingBy, vatRate, cgst, sgst, igst, billed, billedDate, bill_ref);
				boolean updateInvoice = allUpdateDAO.invoiceUpdate(invoiceBean);

				SltlinvoiceBean sltlinvoiceBean = new SltlinvoiceBean(sInvoiceid, sltl_invoice_num, new Date(),
						totalSltlOutStanding, 0, 0, totalSltlOutStanding, userBean, iBean, currencyType, conversion);
				boolean updateSltlInvoice = allUpdateDAO.sltlInvoiceUpdate(sltlinvoiceBean);
			} else {
				error = "Rate Criteria Missing !!!";
			}
		} else {
			error = "Please choose atleast one Challan !!!";
		}

		List<WorkHistoryBean> listOfWork = null;
		listOfWork = allListDAO.listOfWorkHistoryByCustomerId(custId, "", "");

		request.setAttribute("listOfPendingCallans", listOfWork);

		String encodeError = new EncodeDecode().encodeString(error);

		if (invoiceid.equalsIgnoreCase("0")) {
			String page = "redirect?p=Z2VuZXJhdGVCaWxs&error=" + encodeError;
			response.sendRedirect(page);
		} else {
			String encodeIId = new EncodeDecode().encodeString(String.valueOf(invoiceid));
			String page = "redirect?p=aW52b2ljZURldGFpbHM=&iId=" + encodeIId + "&error=" + encodeError;
			response.sendRedirect(page);
		}

		return null;
	}

	@RequestMapping(value = "/stockHistory", method = RequestMethod.POST) // Mapping for Call the controller
	public String stockHistory(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {
		int custId = Integer.parseInt(request.getParameter("custId"));
		int stockStatus = Integer.parseInt(request.getParameter("stockStatus"));
		String kapan = request.getParameter("kapan");
		String lot = request.getParameter("lot");
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");
		int userCustId = Integer.parseInt(request.getParameter("userCustId"));

		String parseFromDate = "";
		String parseToDate = "";

		SimpleDateFormat yyyymmdd = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat ddmmyyyy = new SimpleDateFormat("dd/MM/yyyy");

		List<WorkHistoryBean> listOfWork = null;

		if (!fromDate.equalsIgnoreCase("") && !toDate.equalsIgnoreCase("")) {

			parseFromDate = yyyymmdd.format(ddmmyyyy.parse(fromDate));
			parseToDate = yyyymmdd.format(ddmmyyyy.parse(toDate));

			listOfWork = allListDAO.listOfPendingStockWorkHistoryByCustomerId(custId, stockStatus, parseFromDate,
					parseToDate, userCustId, lot, kapan);

		} else {
			listOfWork = allListDAO.listOfPendingStockWorkHistoryByCustomerId(custId, stockStatus, parseFromDate,
					parseToDate, userCustId, lot, kapan);
		}

		request.setAttribute("listOfPendingCallans", listOfWork);

		String page = "c3RvY2tIaXN0b3J5";
		String decodeText = new EncodeDecode().decodeString(page);

		return decodeText;
	}

	@RequestMapping(value = "/stockHistoryForUser", method = RequestMethod.POST) // Mapping for Call the controller
	public String stockHistoryForUser(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {
		int custId = Integer.parseInt(request.getParameter("custId"));
		int stockStatus = Integer.parseInt(request.getParameter("stockStatus"));
		String kapan = request.getParameter("kapan");
		String lot = request.getParameter("lot");
		String fromDate = request.getParameter("fromDate");
		String toDate = request.getParameter("toDate");
		String stoneName = request.getParameter("stoneName");
		int userCustId = Integer.parseInt(request.getParameter("userCustId"));

		String parseFromDate = "";
		String parseToDate = "";

		SimpleDateFormat yyyymmdd = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat ddmmyyyy = new SimpleDateFormat("dd/MM/yyyy");

		List<WorkHistoryBean> listOfWork = null;

		if (!fromDate.equalsIgnoreCase("") && !toDate.equalsIgnoreCase("")) {

			parseFromDate = yyyymmdd.format(ddmmyyyy.parse(fromDate));
			parseToDate = yyyymmdd.format(ddmmyyyy.parse(toDate));

			listOfWork = allListDAO.listOfPendingStockWorkHistoryByCustomerIdForUser(custId, stockStatus, parseFromDate,
					parseToDate, userCustId, lot, kapan, stoneName);

		} else {
			listOfWork = allListDAO.listOfPendingStockWorkHistoryByCustomerIdForUser(custId, stockStatus, parseFromDate,
					parseToDate, userCustId, lot, kapan, stoneName);
		}

		request.setAttribute("listOfPendingCallans", listOfWork);

		String page = "dXNlclNpZGVTdG9ja0hpc3Rvcnk=";
		String decodeText = new EncodeDecode().decodeString(page);

		return decodeText;
	}

	@RequestMapping(value = "/updateStcokStatus", method = RequestMethod.POST) // Mapping for Call the controller
	public String updateStcokStatus(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {
		String[] wids = request.getParameterValues("wId");
		int custId = Integer.parseInt(request.getParameter("custId"));
		int userCustId = Integer.parseInt(request.getParameter("userCustId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		int stockStatus = Integer.parseInt(request.getParameter("stockStatus"));
		int action = Integer.parseInt(request.getParameter("action"));
		String fromDate = request.getParameter("fromDate");
		String lot = request.getParameter("lot");
		String kapan = request.getParameter("kapan");
		String toDate = request.getParameter("toDate");
		if (request.getParameterValues("wId") != null) {
			for (String s : wids) {

				String wid = s;

				boolean update = allUpdateDAO.updateWorkStockStatus(wid, userId, action);
				boolean liveupdate = allLiveUpdateDAO.updateWorkStockStatus(wid, userId, action);

				List<WorkHistoryBean> listOfChildWork = allListDAO.listOfWorkHistoryByParentWorkId(String.valueOf(wid));

				for (WorkHistoryBean www : listOfChildWork) {
					wid = www.getWork_history_id();

					update = allUpdateDAO.updateWorkStockStatus(wid, userId, action);
					liveupdate = allLiveUpdateDAO.updateWorkStockStatus(wid, userId, action);
				}

			}
		}

		String parseFromDate = "";
		String parseToDate = "";

		SimpleDateFormat yyyymmdd = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat ddmmyyyy = new SimpleDateFormat("dd/MM/yyyy");

		List<WorkHistoryBean> listOfWork = null;

		if (!fromDate.equalsIgnoreCase("") && !toDate.equalsIgnoreCase("")) {

			parseFromDate = yyyymmdd.format(ddmmyyyy.parse(fromDate));
			parseToDate = yyyymmdd.format(ddmmyyyy.parse(toDate));

			listOfWork = allListDAO.listOfPendingStockWorkHistoryByCustomerId(custId, stockStatus, parseFromDate,
					parseToDate, userCustId, lot, kapan);

		} else {
			listOfWork = allListDAO.listOfPendingStockWorkHistoryByCustomerId(custId, stockStatus, parseFromDate,
					parseToDate, userCustId, lot, kapan);
		}

		request.setAttribute("listOfPendingCallans", listOfWork);

		String page = "c3RvY2tIaXN0b3J5";
		String decodeText = new EncodeDecode().decodeString(page);

		return decodeText;
	}

	@RequestMapping(value = "/detailsOfLastWorkHistory", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String detailsOfLastWorkHistory(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {
		int cId = Integer.parseInt(request.getParameter("cId"));

		// Call the method for get details of Specification Of Field Detail
		WorkHistoryBean workHistoryBean = allListDAO.workHistoryCustId(cId);

		// This is use for convert data into json format
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(workHistoryBean);

		return jsonArray;
	}

	@RequestMapping(value = "/checkStoneName", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String checkStoneName(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {
		int cId = Integer.parseInt(request.getParameter("custId"));
		String stoneName = request.getParameter("stoneName");
		String kapanName = request.getParameter("kapanName");

		CustomerBean customerBean = allListDAO.customerDetails(cId);

		String cCode = customerBean.getParent_customer_code();

		// Call the method for get details of Specification Of Field Detail
		WorkHistoryBean workHistoryBean = allListDAO.workHistoryCustCodeStoneKapan(cCode, stoneName, kapanName);

		String output = "false";
		if (workHistoryBean != null) {
			output = "true";
		}

		return output;
	}

	@RequestMapping(value = "/apiForAdapter", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String apiForAdapter(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {
		String customer_code = request.getParameter("customer_code");
		String SLT_Planning = request.getParameter("SLT_Planning");

		SLT_Planning = SLT_Planning.replaceAll(" ", "%20");

		String urlStr = "http://103.11.117.101:6018/Nebula/servlet/adapterCloudServer?customer_code=" + customer_code
				+ "&SLT_Planning=" + SLT_Planning; // just a string
		String str = "";
		String output = "";
		try {
			URL url = new URL(urlStr);
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));

			while (null != (str = br.readLine())) {
				// System.out.println(str);
				output = output + str.trim();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		// System.out.println(output);

		return output;
	}

	@RequestMapping(value = "/apiForQc", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String apiForQc(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {
		String customer_code = request.getParameter("customer_code");
		String SLT_Planning = request.getParameter("SLT_Planning");

		SLT_Planning = SLT_Planning.replaceAll(" ", "%20");

		String urlStr = "http://103.11.117.101:6018/Nebula/servlet/qcCloudServer?customer_code=" + customer_code
				+ "&SLT_Planning=" + SLT_Planning; // just a string
		String str = "";
		String output = "";
		try {
			URL url = new URL(urlStr);
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));

			while (null != (str = br.readLine())) {
				// System.out.println(str);
				output = output + str.trim();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		// System.out.println(output);

		return output;
	}

	@RequestMapping(value = "/apiForAnalyzer", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String apiForAnalyzer(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {
		String customer_code = request.getParameter("customer_code");
		String SLT_Planning = request.getParameter("SLT_Planning");

		SLT_Planning = SLT_Planning.replaceAll(" ", "%20");

		String urlStr = "http://103.11.117.101:6018/Nebula/servlet/analyzerCloudServer?customer_code=" + customer_code
				+ "&SLT_Planning=" + SLT_Planning; // just a string
		String str = "";
		String output = "";
		try {
			URL url = new URL(urlStr);
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));

			while (null != (str = br.readLine())) {
				// System.out.println(str);
				output = output + str.trim();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		// System.out.println(output);
		return output;
	}

	@RequestMapping(value = "/rateCriteriaUpdate", method = RequestMethod.GET) // Mapping for Call the controller
	@ResponseBody
	public String rateCriteriaUpdate(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int rateId = Integer.parseInt(request.getParameter("rateId"));
		String value = request.getParameter("value");
		String action = request.getParameter("action");

		AllUpdateDAO allUpdateDAO = new AllUpdateDAO();

		boolean result = allUpdateDAO.updateRateCriteria(rateId, value, action);
		String output = "false";
		if (result == true) {
			output = "true";
		}

		System.out.println(output);

		return output;
	}

	@RequestMapping(value = "/setRateCriteriaForCustomer", method = RequestMethod.GET) // Mapping for Call the
																						// controller
	@ResponseBody
	public String setRateCriteriaForCustomer(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {
		int pId = Integer.parseInt(request.getParameter("pId"));
		int cId = Integer.parseInt(request.getParameter("cId"));
		int ctId = Integer.parseInt(request.getParameter("ctId"));
		int uId = Integer.parseInt(request.getParameter("uId"));
		double discount = 0;

		if (request.getParameter("discount") != null) {
			discount = Double.parseDouble(request.getParameter("discount"));
		}

		CustomerBean c = allListDAO.customerDetails(cId);
		int Pcid = c.getParent_customer_id();

		CustomerTypeBean customerTypeBean = new CustomerTypeBean();
		customerTypeBean.setCustomer_type_id(ctId);

		UserBean userBean = new UserBean();
		userBean.setUser_id(uId);

		CustomerBean customerBean = new CustomerBean();
		customerBean.setCustomer_id(cId);

		ProductMasterBean productMasterBean = new ProductMasterBean();
		productMasterBean.setProduct_master_id(pId);

		CustomerProductRateBean customerProductRateBean1 = allListDAO.detailsOfCustomerProductRate(cId, pId, ctId);

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date deactiveDate = simpleDateFormat.parse("1900-01-01");
		int active = 1;

		if (customerProductRateBean1 != null) {
			int cprb = customerProductRateBean1.getCustomer_product_rate_id();
			CustomerProductRateBean customerProductRateBean = new CustomerProductRateBean(cprb, discount, new Date(),
					customerTypeBean, customerBean, userBean, productMasterBean, deactiveDate, active);
			boolean update = allUpdateDAO.clientProductRateUpdate(customerProductRateBean);
		} else {
			boolean update = allUpdateDAO.deactiveProductRate(cId, pId);
			CustomerProductRateBean customerProductRateBean = new CustomerProductRateBean(discount, new Date(),
					customerTypeBean, customerBean, userBean, productMasterBean, deactiveDate, active);
			boolean insertProductRate = allInsertDAO.customerProductRateInsert(customerProductRateBean, cId);
		}

		/* Now There is no need for this */

		/*
		 * int status = 1;
		 * 
		 * List<String> groupOfRateCrieria = allListDAO.groupOfRateCrieria(ctId, cId,
		 * pId);
		 * 
		 * List<String> groupOfRateCrieriaParent = allListDAO.groupOfRateCrieria(ctId,
		 * Pcid, pId); for (String name : groupOfRateCrieriaParent) {
		 * 
		 * RateCriteriaBean rateCriteriaBean = allListDAO.detailsOfLastRate(ctId, name,
		 * Pcid, pId); RateCriteriaBean currRateCriteriaBean =
		 * allListDAO.detailsOfLastRate(ctId, name, cId, pId);
		 * 
		 * double sizeFrom = rateCriteriaBean.getCarat_size_from(); double sizeTo =
		 * rateCriteriaBean.getCarat_size_to(); double rate =
		 * rateCriteriaBean.getRate(); double sltlShare =
		 * rateCriteriaBean.getSltl_share(); double minRate =
		 * rateCriteriaBean.getMin_rate(); double rateStone =
		 * rateCriteriaBean.getRate_per_stone(); double minRateStone =
		 * rateCriteriaBean.getMin_rate_per_stone(); Date effactiveDate =
		 * rateCriteriaBean.getEffective_date();
		 * 
		 * productMasterBean.setProduct_master_id(pId);
		 * 
		 * if (currRateCriteriaBean == null) { RateCriteriaBean rateCriteriaBeanSub =
		 * new RateCriteriaBean(sizeFrom, sizeTo, 0, 0, rate, effactiveDate, new Date(),
		 * userBean, customerTypeBean, name, status, cId, productMasterBean, sltlShare,
		 * 0, minRate, rateStone, minRateStone); boolean resultInsert =
		 * allInsertDAO.rateCriteriaInsert(rateCriteriaBeanSub, cId); } else { rate =
		 * currRateCriteriaBean.getRate(); minRate = currRateCriteriaBean.getMin_rate();
		 * rateStone = currRateCriteriaBean.getRate_per_stone(); minRateStone =
		 * currRateCriteriaBean.getMin_rate_per_stone(); status =
		 * currRateCriteriaBean.getStatus(); RateCriteriaBean rateCriteriaBeanSub = new
		 * RateCriteriaBean(currRateCriteriaBean.getRate_criteria_id(), sizeFrom,
		 * sizeTo, 0, 0, rate, effactiveDate, new Date(), userBean, customerTypeBean,
		 * name, status, cId, productMasterBean, sltlShare, 0, minRate, rateStone,
		 * minRateStone); boolean resultUpdate =
		 * allUpdateDAO.rateCriteriaUpdate(rateCriteriaBeanSub); }
		 * 
		 * }
		 */
		String encodeCtId = new EncodeDecode().encodeString(String.valueOf(ctId));
		String encodeCId = new EncodeDecode().encodeString(String.valueOf(cId));
		String encodePId = new EncodeDecode().encodeString(String.valueOf(pId));

		response.sendRedirect("redirect?p=cmF0ZUNhcml0ZXJpYUZvclN1YkN1c3RvbWVy&ct_id=" + encodeCtId + "&cId="
				+ encodeCId + "&pId=" + encodePId);

		return null;
	}

	@RequestMapping(value = "/getRateMaster", method = RequestMethod.GET) // Mapping for Call the controller
	@ResponseBody
	public String getRateMaster(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {

		int pId = Integer.parseInt(request.getParameter("pId"));
		int ctId = Integer.parseInt(request.getParameter("ctId"));
		int cId = Integer.parseInt(request.getParameter("cId"));
		int decodeCustId = 1;

		String jsonArray = "[";

		SimpleDateFormat ddmmyyyy = new SimpleDateFormat("dd/MM/yyyy");

		List<String> groupOfRateCrieria = allListDAO.groupOfRateCrieriaByCondition(ctId, decodeCustId, pId, cId);
		for (String name : groupOfRateCrieria) {

			RateCriteriaBean rateCriteriaBean = allListDAO.detailsOfLastRate(ctId, name, decodeCustId, pId);

			String encodeName = new EncodeDecode().encodeString(name);
			String encodePId = new EncodeDecode().encodeString(String.valueOf(pId));
			String encodeCtId = new EncodeDecode().encodeString(String.valueOf(ctId));

			jsonArray = jsonArray + "{\"sizeFrom\":\"" + rateCriteriaBean.getCarat_size_from() + "\",\"sizeTo\":\""
					+ rateCriteriaBean.getCarat_size_to() + "\",\"rate\":\"" + rateCriteriaBean.getRate()
					+ "\",\"sltlShare\":\"" + rateCriteriaBean.getSltl_share() + "\",\"date\":\""
					+ ddmmyyyy.format(rateCriteriaBean.getEffective_date()) + "\",\"encodeName\":\"" + encodeName
					+ "\",\"encodePId\":\"" + encodePId + "\",\"encodeCtId\":\"" + encodeCtId + "\",\"id\":\""
					+ rateCriteriaBean.getRate_criteria_id() + "\",\"min_rate\":\"" + rateCriteriaBean.getMin_rate()
					+ "\",\"rate_per_stone\":\"" + rateCriteriaBean.getRate_per_stone() + "\",\"min_rate_per_stone\":\""
					+ rateCriteriaBean.getMin_rate_per_stone() + "\"}";

		}

		jsonArray = jsonArray.replace("}{", "},{");
		jsonArray = jsonArray + "]";

		return jsonArray;
	}

	@RequestMapping(value = "/uploadRate", method = RequestMethod.GET) // Mapping for Call the controller
	@ResponseBody
	public String uploadRate(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int rateId = Integer.parseInt(request.getParameter("rId"));
		int pId = Integer.parseInt(request.getParameter("pId"));
		int cId = Integer.parseInt(request.getParameter("cId"));
		int ctId = Integer.parseInt(request.getParameter("ctId"));
		int uId = Integer.parseInt(request.getParameter("uId"));

		ProductMasterBean productMasterBean = new ProductMasterBean();
		CustomerTypeBean customerTypeBean = new CustomerTypeBean();
		UserBean userBean = new UserBean();

		RateCriteriaBean rateCriteriaBean = allListDAO.detailsOfLastRateByRateId(rateId);
		String name = rateCriteriaBean.getName();

		double sizeFrom = rateCriteriaBean.getCarat_size_from();
		double sizeTo = rateCriteriaBean.getCarat_size_to();
		double rate = rateCriteriaBean.getRate();
		double sltlShare = rateCriteriaBean.getSltl_share();
		double minRate = rateCriteriaBean.getMin_rate();
		double rateStone = rateCriteriaBean.getRate_per_stone();
		double minRateStone = rateCriteriaBean.getMin_rate_per_stone();

		Date effactiveDate = rateCriteriaBean.getEffective_date();
		int status = rateCriteriaBean.getStatus();
		productMasterBean.setProduct_master_id(pId);
		customerTypeBean.setCustomer_type_id(ctId);
		userBean.setUser_id(uId);

		RateCriteriaBean rateCriteriaBeanSub = new RateCriteriaBean(sizeFrom, sizeTo, 0, 0, rate, effactiveDate,
				new Date(), userBean, customerTypeBean, name, status, cId, productMasterBean, sltlShare, 0, minRate,
				rateStone, minRateStone);
		boolean resultInsert = allInsertDAO.rateCriteriaInsert(rateCriteriaBeanSub, cId);

		return null;
	}

	@RequestMapping(value = "/getRateData", method = RequestMethod.GET) // Mapping for Call the controller
	@ResponseBody
	public String getRateData(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {
		int pId = Integer.parseInt(request.getParameter("pId"));
		int ctId = Integer.parseInt(request.getParameter("ctId"));
		int cId = Integer.parseInt(request.getParameter("cId"));

		String jsonArray = "[";

		SimpleDateFormat ddmmyyyy = new SimpleDateFormat("dd/MM/yyyy");

		List<String> groupOfRateCrieria = allListDAO.groupOfRateCrieria(ctId, cId, pId);
		for (String name : groupOfRateCrieria) {

			RateCriteriaBean rateCriteriaBean = allListDAO.detailsOfLastRate(ctId, name, cId, pId);

			String encodeName = new EncodeDecode().encodeString(name);
			String encodePId = new EncodeDecode().encodeString(String.valueOf(pId));
			String encodeCtId = new EncodeDecode().encodeString(String.valueOf(ctId));

			jsonArray = jsonArray + "{\"sizeFrom\":\"" + rateCriteriaBean.getCarat_size_from() + "\",\"sizeTo\":\""
					+ rateCriteriaBean.getCarat_size_to() + "\",\"rate\":\"" + rateCriteriaBean.getRate()
					+ "\",\"sltlShare\":\"" + rateCriteriaBean.getSltl_share() + "\",\"date\":\""
					+ ddmmyyyy.format(rateCriteriaBean.getEffective_date()) + "\",\"encodeName\":\"" + encodeName
					+ "\",\"encodePId\":\"" + encodePId + "\",\"encodeCtId\":\"" + encodeCtId + "\",\"id\":\""
					+ rateCriteriaBean.getRate_criteria_id() + "\",\"min_rate\":\"" + rateCriteriaBean.getMin_rate()
					+ "\",\"rate_per_stone\":\"" + rateCriteriaBean.getRate_per_stone() + "\",\"min_rate_per_stone\":\""
					+ rateCriteriaBean.getMin_rate_per_stone() + "\"}";

		}

		jsonArray = jsonArray.replace("}{", "},{");
		jsonArray = jsonArray + "]";

		return jsonArray;
	}

	@RequestMapping(value = "/currencyUpdate", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String currencyUpdate(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int cId = Integer.parseInt(request.getParameter("cId"));
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String value = request.getParameter("val");

		AllUpdateDAO allUpdateDAO = new AllUpdateDAO();
		AllListDAO allListDAO = new AllListDAO();
		AllInsertDAO allInsertDAO = new AllInsertDAO();

		CurrencyBean currencyBean = allListDAO.listOfCurrency(cId, from, to);
		double dvalue = 0;
		boolean flag = true;
		try {
			dvalue = Double.parseDouble(value);
		} catch (Exception e) {
			// TODO: handle exception
			flag = false;
		}

		String output = "false";
		if (flag == true) {
			if (currencyBean == null) {

				CurrencyBean c = new CurrencyBean(from, to, dvalue, new Date(), cId);
				boolean insert = allInsertDAO.currencyInsert(c, cId);
				output = "true";

			} else {
				int curId = currencyBean.getCurrency_id();
				boolean update = allUpdateDAO.currencyUpdate(curId, dvalue);
				output = "true";
			}
		}

		return output;
	}

	@RequestMapping(value = "/updateInvoiceDiscountValue", method = RequestMethod.POST) // Mapping for Call the
																						// controller
	@ResponseBody
	public String updateInvoiceDiscountValue(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String iId = request.getParameter("iId");
		double discountVal = Double.parseDouble(request.getParameter("per"));

		AllListDAO allListDAO = new AllListDAO();

		InvoiceBean invoiceBean = allListDAO.detailsOfInvoice(iId);
		SltlinvoiceBean sltlinvoiceBean = allListDAO.detailsOfSltlInvoice(iId);

		double invoiceFinalOutstanding = invoiceBean.getGross_outstanding();
		double disValue = (discountVal * invoiceFinalOutstanding) / 100;
		System.out.println(disValue);

		double finalOutStanding = invoiceFinalOutstanding - disValue;

		double sltlInvoiceFinalOutstanding = sltlinvoiceBean.getSltl_gross_outstanding();
		double sltldiscountVal = (discountVal * sltlInvoiceFinalOutstanding) / 100;

		double sltlfinalOutStanding = sltlInvoiceFinalOutstanding - sltldiscountVal;

		AllUpdateDAO allUpdateDAO = new AllUpdateDAO();

		boolean invoiceDisUpdate = allUpdateDAO.invoiceDisUpdate(iId, discountVal, disValue, finalOutStanding);
		boolean sltlinvoiceDisUpdate = allUpdateDAO.sltlinvoiceDisUpdate(iId, discountVal, sltldiscountVal,
				sltlfinalOutStanding);

		return null;
	}

	@RequestMapping(value = "/crrencyConversionInvoice", method = RequestMethod.POST) // Mapping for Call the controller
	public String crrencyConversionInvoice(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String iId = request.getParameter("iId");
		String toCurr = request.getParameter("curr");
		int cId = Integer.parseInt(request.getParameter("cId"));
		String fromCurr = "USD";

		AllListDAO allListDAO = new AllListDAO();

		/* For Invoice */

		InvoiceBean invoiceBean = allListDAO.detailsOfInvoice(iId);

		double invoiceGrossValue = invoiceBean.getGross_outstanding();
		double invoiceDiscountValue = invoiceBean.getDiscount_amount();
		double invoiceFinalOutstanding = invoiceBean.getFinal_outstanding();

		int ccId = cId;
		CurrencyBean currencyCurrent = allListDAO.listOfCurrency(ccId, fromCurr, invoiceBean.getCurrency_type());
		CurrencyBean currencyBean = allListDAO.listOfCurrency(ccId, fromCurr, toCurr);
		double conversion = currencyBean.getConversion();

		/* Convert to USD */
		invoiceGrossValue = (invoiceGrossValue * 1) / invoiceBean.getConversion();
		invoiceDiscountValue = (invoiceDiscountValue * 1) / invoiceBean.getConversion();
		invoiceFinalOutstanding = (invoiceFinalOutstanding * 1) / invoiceBean.getConversion();

		/* Now Convert to selected Currency */
		invoiceGrossValue = invoiceGrossValue * currencyBean.getConversion();
		invoiceDiscountValue = invoiceDiscountValue * currencyBean.getConversion();
		invoiceFinalOutstanding = invoiceFinalOutstanding * currencyBean.getConversion();

		boolean invoiceCurrencyUpdate = allUpdateDAO.invoiceCurrUpdate(iId, invoiceGrossValue, invoiceDiscountValue,
				invoiceFinalOutstanding, toCurr, conversion);

		List<InvoiceLineBean> listOfInvoiceLine = allListDAO.listOfInvoiceLine(iId);
		for (InvoiceLineBean il : listOfInvoiceLine) {

			double rate = il.getRate();

			/* Convert to USD */
			rate = (rate * 1) / invoiceBean.getConversion();

			/* Now Convert to selected Currency */
			rate = rate * currencyBean.getConversion();

			boolean invoiceLineUpdate = allUpdateDAO.invoicelineCurrUpdate(il.getInvoice_line_id(), rate);
		}

		/* For SLTL Invoice */

		ccId = 1;
		toCurr = "USD";
		currencyCurrent = allListDAO.listOfCurrency(ccId, fromCurr, invoiceBean.getCurrency_type());
		currencyBean = allListDAO.listOfCurrency(ccId, fromCurr, toCurr);
		conversion = currencyBean.getConversion();

		SltlinvoiceBean sltlinvoiceBean = allListDAO.detailsOfSltlInvoice(iId);

		double sltlInvoiceGrossValue = sltlinvoiceBean.getSltl_gross_outstanding();
		double sltlInvoiceDiscountValue = sltlinvoiceBean.getSltl_discount_amount();
		double sltlInvoiceFinalOutstanding = sltlinvoiceBean.getSltl_final_outstanding();

		/* Convert to USD */
		sltlInvoiceGrossValue = (sltlInvoiceGrossValue * 1) / sltlinvoiceBean.getConversion();
		sltlInvoiceDiscountValue = (sltlInvoiceDiscountValue * 1) / sltlinvoiceBean.getConversion();
		sltlInvoiceFinalOutstanding = (sltlInvoiceFinalOutstanding * 1) / sltlinvoiceBean.getConversion();

		/* Now Convert to selected Currency */
		sltlInvoiceGrossValue = sltlInvoiceGrossValue * currencyBean.getConversion();
		sltlInvoiceDiscountValue = sltlInvoiceDiscountValue * currencyBean.getConversion();
		sltlInvoiceFinalOutstanding = sltlInvoiceFinalOutstanding * currencyBean.getConversion();

		boolean sltlinvoiceCurrencyUpdate = allUpdateDAO.sltlinvoiceCurrUpdate(iId, sltlInvoiceGrossValue,
				sltlInvoiceDiscountValue, sltlInvoiceFinalOutstanding, toCurr, conversion);

		List<SltlInvoiceLineBean> listOfSltlInvoiceLine = allListDAO.listOfSltlInvoiceLine(iId);

		for (SltlInvoiceLineBean sil : listOfSltlInvoiceLine) {

			double rate = sil.getAmount();

			/* Convert to USD */
			rate = (rate * 1) / sltlinvoiceBean.getConversion();

			/* Now Convert to selected Currency */
			rate = rate * currencyBean.getConversion();

			boolean sltlInvoiceLineUpdate = allUpdateDAO.sltlInvoicelineCurrUpdate(sil.getSltl_invoice_line_id(), rate);
		}

		return null;
	}

	@RequestMapping(value = "/invoicePosting", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String invoicePosting(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {
		String iId = request.getParameter("iId");
		int user_id = Integer.parseInt(request.getParameter("user_id"));

		System.out.println(user_id);

		boolean postingUpdate = allUpdateDAO.invoicePostingUpdate(iId, user_id, new Date());

		return null;
	}

	@RequestMapping(value = "/invoiceUnPosting", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String invoiceUnPosting(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {
		String iId = request.getParameter("iId");
		int user_id = Integer.parseInt(request.getParameter("user_id"));

		System.out.println(user_id);

		boolean postingUpdate = allUpdateDAO.invoiceUnPostingUpdate(iId, user_id, new Date());

		return null;
	}

	@RequestMapping(value = "/listOfPendingChallansforCreate", method = RequestMethod.POST) // Mapping for Call the
																							// controller
	public String listOfPendingChallansforCreate(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int custId = Integer.parseInt(request.getParameter("custId"));
		List<WorkHistoryBean> listOfWork = null;

		listOfWork = allListDAO.listOfWorkHistoryByCustomerIdForChallanCreator(custId);

		request.setAttribute("listOfPendingChallans", listOfWork);

		String page = "Y2hhbGxhbkNyZWF0b3I=";
		String decodeText = new EncodeDecode().decodeString(page);

		return decodeText;
	}

	@RequestMapping(value = "/deleteRate", method = RequestMethod.GET) // Mapping for Call the controller
	public String deleteRate(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));

		RateCriteriaBean rateCriteriaBean = allListDAO.detailsOfLastRateByRateId(id);

		String name = rateCriteriaBean.getName();
		int custId = rateCriteriaBean.getCustomer_id();
		int custTypeId = rateCriteriaBean.getCustomerTypeBean().getCustomer_type_id();

		boolean result = allUpdateDAO.updateRateCriteriaStatus(custId, custTypeId, name);

		return null;
	}

	@RequestMapping(value = "/generateChallan", method = RequestMethod.POST) // Mapping for Call the controller
	public String generateChallan(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int custId = Integer.parseInt(request.getParameter("custId"));
		String[] wIdArray = request.getParameterValues("wId");
		int user_id = Integer.parseInt(request.getParameter("userId"));
		int userCustId = Integer.parseInt(request.getParameter("userCustId"));

		UserBean userBean = new UserBean();
		userBean.setUser_id(user_id);

		CustomerBean customerBean = new CustomerBean();
		customerBean.setCustomer_id(custId);

		Calendar cc = Calendar.getInstance();
		int year = cc.get(Calendar.YEAR);
		int month = cc.get(Calendar.MONTH) + 1;

		int year1 = 0;
		int year2 = 0;

		if (month > 3 && month <= 12) {
			year1 = year;
			year2 = year + 1;
		} else if (month >= 1 && month < 4) {
			year1 = year - 1;
			year2 = year;
		}

		CustomerBean cuBean = allListDAO.customerDetails(custId);
		CustomerBean customerBean2 = allListDAO.customerDetails(cuBean.getParent_customer_id());

		long maxNumber = allCountDAO.getlastNumberOfChallanByCustomer(cuBean.getParent_customer_id(), year1, year2);

		int nextNum = (int) (maxNumber + 1);

		String challanNumber = String.valueOf(nextNum);

		challanNumber = customerBean2.getChallan_seq() + "" + String.format("%05d", nextNum);
		;

		String error = "";

		String challanId = "0";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");

		/*
		 * if(request.getParameterValues("wId") != null) { boolean flag = false;
		 * for(String ss : wIdArray) { String wId1 = ss; List<WorkHistoryBean>
		 * listOfChildWork = allListDAO.listOfWorkHistoryByParentWorkId(wId1);
		 * 
		 * WorkHistoryBean workHistoryBean1 = allListDAO.workHistoryId(wId1); String
		 * date1 = simpleDateFormat.format(workHistoryBean1.getInsert_date()); double
		 * carat1 = Double.parseDouble(workHistoryBean1.getActual_weight());
		 * List<WorkProductBean> listofWorkProduct1 =
		 * allListDAO.listOfWorkProduct(wId1); for(WorkProductBean w1 :
		 * listofWorkProduct1) { int prod_id1 =
		 * w1.getProductMasterBean().getProduct_master_id();
		 * 
		 * CustomerProductRateBean customerProductRateBean =
		 * allListDAO.detailsOfCustomerProductRateByCustId(custId, prod_id1);
		 * 
		 * if(customerProductRateBean != null) {
		 * 
		 * int pid =
		 * customerProductRateBean.getProductMasterBean().getProduct_master_id(); int
		 * custType =
		 * customerProductRateBean.getCustomerTypeBean().getCustomer_type_id();
		 * 
		 * List<WorkProductProcessBean> listOfProcessByProdId =
		 * allListDAO.listOfWorkProductProcessByProduct(pid,custId);
		 * 
		 * double criteria = 0;
		 * 
		 * if(custType == 1) { criteria = carat1; }else if(custType == 2) { criteria =
		 * listOfProcessByProdId.size(); }
		 * 
		 * RateCriteriaBean rateCriteriaBean =
		 * allListDAO.findRateOfCarat(custType,criteria,custId,prod_id1,date1);
		 * 
		 * if(rateCriteriaBean == null) { flag = true; } }else { flag = true; } } }
		 * 
		 * 
		 * System.out.println("====="+flag);
		 * 
		 * if(flag == false) {
		 * 
		 * ChallanBean challanBean = new ChallanBean(challanNumber, new Date(),
		 * userBean, customerBean); boolean challanInsert =
		 * allInsertDAO.challanInsert(challanBean, userCustId);
		 * 
		 * ChallanBean c = new ChallanBean();
		 * c.setChallan_id(challanBean.getChallan_id());
		 * 
		 * challanId = challanBean.getChallan_id(); double totalcarat = 0; double
		 * totalOutStanding = 0; double totalSltlOutStanding = 0;
		 * 
		 * double discount_per = 0; double discount_amount = 0; double final_outstanding
		 * = totalOutStanding - discount_amount;
		 * 
		 * String currencyType = "USD"; double conversion = 1;
		 * 
		 * 
		 * CustomerTypeBean customerTypeBean = new CustomerTypeBean(); SltlinvoiceBean
		 * sIBean = new SltlinvoiceBean(); InvoiceBean iBean = new InvoiceBean();
		 * 
		 * 
		 * for(String s : wIdArray) {
		 * 
		 * String wId = s; List<WorkHistoryBean> listOfChildWork =
		 * allListDAO.listOfWorkHistoryByParentWorkId(wId);
		 * System.out.println("$$$$$"+wId);
		 * 
		 * WorkHistoryBean workHistoryBean = allListDAO.workHistoryId(wId); String date
		 * = simpleDateFormat.format(workHistoryBean.getInsert_date());
		 * 
		 * List<WorkProductBean> listofWorkProduct = allListDAO.listOfWorkProduct(wId);
		 * 
		 * double carat = Double.parseDouble(workHistoryBean.getActual_weight());
		 * totalcarat = totalcarat + carat;
		 * 
		 * for(WorkProductBean w : listofWorkProduct) {
		 * 
		 * int prod_id = w.getProductMasterBean().getProduct_master_id();
		 * System.out.println("-----"+prod_id); CustomerProductRateBean
		 * customerProductRateBean =
		 * allListDAO.detailsOfCustomerProductRateByCustId(custId, prod_id);
		 * 
		 * if(customerProductRateBean != null) { System.out.println("-----iin");
		 * 
		 * int pid =
		 * customerProductRateBean.getProductMasterBean().getProduct_master_id(); int
		 * custType =
		 * customerProductRateBean.getCustomerTypeBean().getCustomer_type_id();
		 * 
		 * List<WorkProductProcessBean> listOfProcessByProdId =
		 * allListDAO.listOfWorkProductProcessByProduct(pid,custId);
		 * 
		 * double criteria = 0;
		 * 
		 * if(custType == 1) { criteria = carat; }else if(custType == 2) { criteria =
		 * listOfProcessByProdId.size(); }
		 * 
		 * 
		 * 
		 * ProductMasterBean p = new ProductMasterBean();
		 * p.setProduct_master_id(prod_id);
		 * 
		 * RateCriteriaBean rateCriteriaBean =
		 * allListDAO.findRateOfCarat(custType,criteria,custId,prod_id,date);
		 * 
		 * if(rateCriteriaBean != null) {
		 * 
		 * double rate = rateCriteriaBean.getRate(); double minrate =
		 * rateCriteriaBean.getMin_rate();
		 * 
		 * if(minrate > rate) {gfghfdg rate = minrate; }
		 * 
		 * 
		 * 
		 * 
		 * double rate = rateCriteriaBean.getRate(); double minrate =
		 * rateCriteriaBean.getMin_rate();
		 * 
		 * if(rate == 0) { rate = rateCriteriaBean.getRate_per_stone(); minrate =
		 * rateCriteriaBean.getMin_rate_per_stone(); }
		 * 
		 * 
		 * 
		 * if(minrate > rate) { rate = minrate; }
		 * 
		 * double finalrate = rate;
		 * 
		 * if(rateCriteriaBean.getRate() != 0) { finalrate = rate * carat; }
		 * 
		 * 
		 * WorkHistoryBean woBean = new WorkHistoryBean();
		 * woBean.setWork_history_id(wId);
		 * 
		 * ChallanLineBean challanLineBean = new ChallanLineBean(challanBean,
		 * workHistoryBean, rate, finalrate, p); boolean challanLineInsert =
		 * allInsertDAO.challanLineInsert(challanLineBean, userCustId);
		 * 
		 * }
		 * 
		 * }
		 * 
		 * }
		 * 
		 * }
		 * 
		 * 
		 * }else { error = "Rate Criteria Missing !!!"; } }else { error =
		 * "Please choose atleast one Challan !!!"; }
		 */

		if (request.getParameterValues("wId") != null) {
			boolean flag = false;

			ChallanBean challanBean = new ChallanBean(challanNumber, new Date(), userBean, customerBean, 1);
			boolean challanInsert = allInsertDAO.challanInsert(challanBean, cuBean.getParent_customer_id());

			ChallanBean c = new ChallanBean();
			c.setChallan_id(challanBean.getChallan_id());

			challanId = challanBean.getChallan_id();
			double totalcarat = 0;
			double totalOutStanding = 0;
			double totalSltlOutStanding = 0;

			double discount_per = 0;
			double discount_amount = 0;
			double final_outstanding = totalOutStanding - discount_amount;

			String currencyType = "USD";
			double conversion = 1;

			CustomerTypeBean customerTypeBean = new CustomerTypeBean();
			SltlinvoiceBean sIBean = new SltlinvoiceBean();
			InvoiceBean iBean = new InvoiceBean();

			for (String s : wIdArray) {

				String wId = s;
				List<WorkHistoryBean> listOfChildWork = allListDAO.listOfWorkHistoryByParentWorkId(wId);
				System.out.println("$$$$$" + wId);

				WorkHistoryBean workHistoryBean = allListDAO.workHistoryId(wId);
				String date = simpleDateFormat.format(workHistoryBean.getInsert_date());

				List<WorkProductBean> listofWorkProduct = allListDAO.listOfWorkProduct(wId);

				double carat = Double.parseDouble(workHistoryBean.getActual_weight());
				totalcarat = totalcarat + carat;

				ProductMasterBean p = new ProductMasterBean();
				for (WorkProductBean w : listofWorkProduct) {

					p.setProduct_master_id(w.getProductMasterBean().getProduct_master_id());

				}

				double rate = 0.0;
				double finalrate = 0.0;

				WorkHistoryBean woBean = new WorkHistoryBean();
				woBean.setWork_history_id(wId);

				ChallanLineBean challanLineBean = new ChallanLineBean(challanBean, workHistoryBean, rate, finalrate, p);
				boolean challanLineInsert = allInsertDAO.challanLineInsert(challanLineBean, userCustId);

				boolean update = allUpdateDAO.updateWorkStockStatus(wId, userCustId, 2);

			}
		} else {
			error = "Please choose atleast one Challan !!!";
		}

		/* For Sync Customer */
		HttpSession session = request.getSession();
		String diamondSession = new EncodeDecode().encodeString("diamondSession");
		UserBean usession = (UserBean) session.getAttribute(diamondSession);
		final String custIdSession = String.valueOf(usession.getCustomer_id());
		new Thread(new Runnable() {
			public void run() {
				// For Sync Challan
				new sync().challanSync(custIdSession);
				// For Sync Work history
				new sync().workHistorySync(custIdSession);
			}
		}).start();
		/* For Sync Customer */

		String encodeError = new EncodeDecode().encodeString(error);

		if (challanId.equalsIgnoreCase("0")) {
			String page = "redirect?p=Y2hhbGxhbkNyZWF0b3I=&error=" + encodeError;
			response.sendRedirect(page);
		} else {
			String encodeChallanId = new EncodeDecode().encodeString(challanId);
			response.sendRedirect("redirect?p=Y2hhbGxhbkxpbmU=&cId=" + encodeChallanId);
		}

		return null;
	}

	@RequestMapping(value = "/generateChallanNew", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String generateChallanNew(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int custId = Integer.parseInt(request.getParameter("custId"));
		String wIdArray = request.getParameter("SIDS");
		int user_id = Integer.parseInt(request.getParameter("userId"));
		int userCustId = Integer.parseInt(request.getParameter("userCustId"));

		UserBean userBean = new UserBean();
		userBean.setUser_id(user_id);

		CustomerBean customerBean = new CustomerBean();
		customerBean.setCustomer_id(custId);

		Calendar cc = Calendar.getInstance();
		int year = cc.get(Calendar.YEAR);
		int month = cc.get(Calendar.MONTH) + 1;

		int year1 = 0;
		int year2 = 0;

		if (month > 3 && month <= 12) {
			year1 = year;
			year2 = year + 1;
		} else if (month >= 1 && month < 4) {
			year1 = year - 1;
			year2 = year;
		}

		CustomerBean cuBean = allListDAO.customerDetails(custId);
		CustomerBean customerBean2 = allListDAO.customerDetails(cuBean.getParent_customer_id());

		long maxNumber = allCountDAO.getlastNumberOfChallanByCustomer(cuBean.getParent_customer_id(), year1, year2);

		int nextNum = (int) (maxNumber + 1);

		String challanNumber = String.valueOf(nextNum);

		challanNumber = customerBean2.getChallan_seq() + "" + String.format("%05d", nextNum);

		String error = "";

		String challanId = "0";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");

		if (request.getParameter("SIDS") != null && !request.getParameter("SIDS").equalsIgnoreCase("")) {
			System.out.println(request.getParameter("SIDS"));
			String[] arr = wIdArray.split(",");
			System.out.println("=====" + arr.length);

			if (arr.length != 0) {

				boolean flag = false;

				String challan_id = "";
				if (request.getParameter("challanId") != null) {
					challan_id = request.getParameter("challanId");
				} else {
					ChallanBean challanBean = new ChallanBean(challanNumber, new Date(), userBean, customerBean, 1);
					boolean challanInsert = allInsertDAO.challanInsert(challanBean, cuBean.getParent_customer_id());
					challan_id = challanBean.getChallan_id();
				}

				ChallanBean c = new ChallanBean();
				c.setChallan_id(challan_id);

				challanId = challan_id;
				double totalcarat = 0;
				double totalOutStanding = 0;
				double totalSltlOutStanding = 0;

				double discount_per = 0;
				double discount_amount = 0;
				double final_outstanding = totalOutStanding - discount_amount;

				String currencyType = "USD";
				double conversion = 1;

				CustomerTypeBean customerTypeBean = new CustomerTypeBean();
				SltlinvoiceBean sIBean = new SltlinvoiceBean();
				InvoiceBean iBean = new InvoiceBean();

				for (String s : arr) {

					String wId = s;
					List<WorkHistoryBean> listOfChildWork = allListDAO.listOfWorkHistoryByParentWorkId(wId);

					WorkHistoryBean workHistoryBean = allListDAO.workHistoryId(wId);
					String date = simpleDateFormat.format(workHistoryBean.getInsert_date());

					List<WorkProductBean> listofWorkProduct = allListDAO.listOfWorkProduct(wId);

					double carat = Double.parseDouble(workHistoryBean.getActual_weight());
					totalcarat = totalcarat + carat;

					ProductMasterBean p = new ProductMasterBean();
					for (WorkProductBean w : listofWorkProduct) {

						p.setProduct_master_id(w.getProductMasterBean().getProduct_master_id());

					}

					double rate = 0.0;
					double finalrate = 0.0;

					WorkHistoryBean woBean = new WorkHistoryBean();
					woBean.setWork_history_id(wId);

					ChallanLineBean challanLineBean = new ChallanLineBean(c, workHistoryBean, rate, finalrate, p);
					boolean challanLineInsert = allInsertDAO.challanLineInsert(challanLineBean, userCustId);

					boolean update = allUpdateDAO.updateWorkStockStatus(wId, userCustId, 2);

					for (WorkHistoryBean ww : listOfChildWork) {
						update = allUpdateDAO.updateWorkStockStatus(ww.getWork_history_id(), userCustId, 2);
					}

				}
			} else {
				error = "Please choose atleast one Challan----- !!!";
			}
		} else {
			error = "Please choose atleast one Challan======= !!!";
		}

		/* For Sync Customer */
		HttpSession session = request.getSession();
		String diamondSession = new EncodeDecode().encodeString("diamondSession");
		UserBean usession = (UserBean) session.getAttribute(diamondSession);
		final String custIdSession = String.valueOf(usession.getCustomer_id());
		new Thread(new Runnable() {
			public void run() {
				new sync().challanSync(custIdSession);
			}
		}).start();
		/* For Sync Customer */

		String encodeError = new EncodeDecode().encodeString(error);
		String output = "";
		if (challanId.equalsIgnoreCase("0")) {
			output = "error";
			// String page = "redirect?p=Y2hhbGxhbkNyZWF0b3I=&error=" + encodeError;
			// response.sendRedirect(page);
		} else {
			String encodeChallanId = new EncodeDecode().encodeString(challanId);

			output = encodeChallanId;

			// response.sendRedirect("redirect?p=Y2hhbGxhbkxpbmU=&cId=" + encodeChallanId);
		}

		response.getWriter().print(output);

		return null;
	}

	@RequestMapping(value = "/generateOutChallan", method = RequestMethod.POST) // Mapping for Call the controller
	public String generateOutChallan(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		System.out.println("in out challan=====");
		String[] wIdArray = request.getParameterValues("wId");
		int user_id = Integer.parseInt(request.getParameter("userId"));
		int userCustId = Integer.parseInt(request.getParameter("userCustId"));
		String challan_id = request.getParameter("challan_id");

		UserBean userBean = new UserBean();
		userBean.setUser_id(user_id);

		ChallanBean challanBean = new ChallanBean();
		challanBean.setChallan_id(challan_id);

		long maxNumber = allCountDAO.getlastNumberOfOutChallanByChallan(challan_id);

		int nextNum = (int) (maxNumber + 1);

		String challanOutNumber = String.valueOf(nextNum);

		String error = "";

		String challanOutId = "0";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");

		if (request.getParameterValues("wId") != null) {

			ChallanOutBean challanOutBean = new ChallanOutBean(challanOutNumber, new Date(), userBean, challanBean);
			boolean challanOutInsert = allInsertDAO.challanOutInsert(challanOutBean, userCustId);

			challanOutId = challanOutBean.getChallan_out_id();
			ChallanOutBean c = new ChallanOutBean();
			c.setChallan_out_id(challanOutId);

			for (String s : wIdArray) {

				WorkHistoryBean workHistoryBean = new WorkHistoryBean();
				workHistoryBean.setWork_history_id(s);

				ChallanOutLineBean challanOutLineBean = new ChallanOutLineBean(c, workHistoryBean);
				boolean challanOutLineInsert = allInsertDAO.challanOutLineInsert(challanOutLineBean, userCustId);

			}

		} else {
			error = "Please choose atleast one Challan !!!";
		}

		/* For Sync Customer */
		/*
		 * HttpSession session = request.getSession(); String diamondSession = new
		 * EncodeDecode().encodeString("diamondSession"); UserBean usession = (UserBean)
		 * session.getAttribute(diamondSession); final String custIdSession =
		 * String.valueOf(usession.getCustomer_id()); new Thread(new Runnable() { public
		 * void run() { new sync().challanSync(custIdSession); } }).start();
		 */
		/* For Sync Customer */

		String encodeChallanId = new EncodeDecode().encodeString(challan_id);
		response.sendRedirect("redirect?p=Y2hhbGxhbkxpbmU=&cId=" + encodeChallanId);

		return null;
	}

	// for redirect page using encode decode method apache base64
	@RequestMapping(value = "/file", method = RequestMethod.GET) // Mapping for Call the controller
	public String file(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// Get requested file by path info.
		String requestedFile = request.getParameter("path");
		int DEFAULT_BUFFER_SIZE = 256;
		// System.out.println(requestedFile);

		Path path = Paths.get(requestedFile);

		// Decode the file name (might contain spaces and on) and prepare file object.
		File file = new File(requestedFile);

		// Get content type by filename.
		// String contentType = getServletContext().getMimeType(file.getName());

		// If content type is unknown, then set the default value.
		// For all content types, see: http://www.w3schools.com/media/media_mimeref.asp
		// To add new content types, add new mime-mapping entry in web.xml.
		String contentType = "application/octet-stream";

		// Init servlet response.
		response.reset();
		response.setBufferSize(DEFAULT_BUFFER_SIZE);
		response.setContentType(contentType);
		response.setHeader("Content-Length", String.valueOf(file.length()));
		response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");

		// Prepare streams.
		BufferedInputStream input = null;
		BufferedOutputStream output = null;

		try {
			// Open streams.
			input = new BufferedInputStream(new FileInputStream(file), DEFAULT_BUFFER_SIZE);
			output = new BufferedOutputStream(response.getOutputStream(), DEFAULT_BUFFER_SIZE);

			// Write file contents to response.
			byte[] buffer = new byte[DEFAULT_BUFFER_SIZE];
			int length;
			while ((length = input.read(buffer)) > 0) {
				output.write(buffer, 0, length);
			}
		} finally {
			// Gently close streams.
			output.close();
			input.close();
		}
		return null;
	}

	// for redirect page using encode decode method apache base64
	@RequestMapping(value = "/removeChallanFromInvoice", method = RequestMethod.POST) // Mapping for Call the controller
	public String removeChallanFromInvoice(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		int ilId = Integer.parseInt(request.getParameter("ilId"));

		boolean updateInvoiceLine = allUpdateDAO.invoicelineActiveStatus(ilId, 0);
		boolean updateSltlInvoiceLine = allUpdateDAO.sltlInvoicelineActiveStatus(ilId, 0);

		return null;
	}

	@RequestMapping(value = "/reCalculateInvoice", method = RequestMethod.POST) // Mapping for Call the controller
	public String reCalculateInvoice(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {
		System.out.println("RECALCULATIG.........");
		String decodeIid = request.getParameter("iId");

		InvoiceBean ii = allListDAO.detailsOfInvoice(decodeIid);
		SltlinvoiceBean sii = allListDAO.detailsOfSltlInvoice(decodeIid);

		List<InvoiceLineBean> listOfInvoiceLine = allListDAO.listOfInvoiceLine(decodeIid);
		List<SltlInvoiceLineBean> listOfSltlInvoiceLine = allListDAO.listOfSltlInvoiceLine(decodeIid);

		int custId = ii.getCustomerBean().getCustomer_id();
		CustomerBean customerBean = allListDAO.customerDetails(custId);

		String customer_code = customerBean.getCustomer_code();
		String main_customer_code = customerBean.getParent_customer_code();
		int parent_customer_id = customerBean.getParent_customer_id();

		CustomerBean parentCust = allListDAO.customerDetails(parent_customer_id);
		double vatRate = parentCust.getVat_rate();
		double cgst = customerBean.getCgst();
		double sgst = customerBean.getSgst();
		double igst = customerBean.getIgst();

		String invoiceid = ii.getInvoice_id();
		String sInvoiceid = sii.getSltl_invoice_id();

		String invoice_num = ii.getInvoice_num();
		String sltl_invoice_num = sii.getSltl_invoice_num();
		int userCustId = ii.getUserBean().getCustomer_id();

		int posting = ii.getPosting();
		int postingBy = ii.getPosting_by();

		UserBean userBean = new UserBean();
		userBean.setUser_id(ii.getUserBean().getUser_id());

		double totalcarat = 0;
		double totalOutStanding = 0;
		double totalSltlOutStanding = 0;

		double discount_per = 0;
		double discount_amount = 0;
		double final_outstanding = totalOutStanding - discount_amount;

		String currencyType = "USD";
		double conversion = 1;
		int active = 1;

		CustomerTypeBean customerTypeBean = new CustomerTypeBean();
		SltlinvoiceBean sIBean = new SltlinvoiceBean();
		InvoiceBean iBean = new InvoiceBean();

		iBean.setInvoice_id(invoiceid);
		sIBean.setSltl_invoice_id(sInvoiceid);

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date postinDate = simpleDateFormat.parse("1900/01/01");
		int count = 0;
		for (InvoiceLineBean i : listOfInvoiceLine) {
			count++;
			System.err.println("======================================" + count);

			System.out.println(
					"======================" + i.getWorkHistoryBean().getStone_name() + "-----" + i.getCarat());
			String invoice_line_id = i.getInvoice_line_id();

			String wId = i.getWorkHistoryBean().getWork_history_id();
			// List<WorkHistoryBean> listOfChildWork =
			// allListDAO.listOfWorkHistoryByParentWorkId(wId);

			WorkHistoryBean workHistoryBean = allListDAO.workHistoryId(wId);
			String date = simpleDateFormat.format(workHistoryBean.getInsert_date());

			List<WorkProductBean> listofWorkProduct = allListDAO.listOfWorkProduct(wId);

			double carat = Double.parseDouble(workHistoryBean.getActual_weight());
			totalcarat = totalcarat + carat;

			System.out.println("Product : " + i.getProductMasterBean().getProduct_name());
			int prod_id = i.getProductMasterBean().getProduct_master_id();

			CustomerProductRateBean customerProductRateBean = allListDAO.detailsOfCustomerProductRateByCustId(custId,
					prod_id);

			if (customerProductRateBean != null) {

				int pid = customerProductRateBean.getProductMasterBean().getProduct_master_id();
				int custType = customerProductRateBean.getCustomerTypeBean().getCustomer_type_id();

				List<WorkProductProcessBean> listOfProcessByProdId = allListDAO.listOfWorkProductProcessByProduct(pid,
						custId);

				double criteria = 0;

				if (custType == 1) {
					criteria = carat;
				} else if (custType == 2) {
					criteria = listOfProcessByProdId.size();
				}

				double discount = customerProductRateBean.getDiscount();
				customerTypeBean.setCustomer_type_id(custType);

				ProductMasterBean p = new ProductMasterBean();
				p.setProduct_master_id(prod_id);

				RateCriteriaBean rateCriteriaBean = allListDAO.findRateOfCarat(custType, criteria, custId, prod_id,
						date);

				if (rateCriteriaBean != null) {

					double rate = rateCriteriaBean.getRate();
					double minrate = rateCriteriaBean.getMin_rate();
					double perStoneRate = 0;

					if (rate == 0) {
						rate = rateCriteriaBean.getRate_per_stone();
						minrate = rateCriteriaBean.getMin_rate_per_stone();
					}

					int minrateflag = 0;
					if (discount != 0) {
						double disAmount = (rate * discount / 100);
						rate = rate - disAmount;
						discount_amount = discount_amount + disAmount;
					}

					if (minrate > rate) {
						rate = minrate;
						minrateflag = 1;
					}

					perStoneRate = rate;
					System.out.println("Perstone Rate ::::" + rate);

					if (rateCriteriaBean.getRate() != 0) {
						rate = rate * carat;
					}

					System.out.println("Rate+++" + rate + "--MIn Rate:::" + minrate);

					double sltlMargine = rateCriteriaBean.getSltl_share();
					totalOutStanding = totalOutStanding + rate;

					System.out.println("totalOutStanding-----" + totalOutStanding);

					double sltlMarginAmt = (rate * sltlMargine) / 100;
					totalSltlOutStanding = totalSltlOutStanding + sltlMarginAmt;

					System.out.println("sltlOutStanding===" + totalSltlOutStanding);

					InvoiceLineBean invoiceLineBean = new InvoiceLineBean(invoice_line_id, String.valueOf(carat), rate,
							new Date(), workHistoryBean, iBean, userBean, p, minrateflag, active, perStoneRate);
					// boolean insertInvoiceLine =
					// allInsertDAO.invoiceLineInsert(invoiceLineBean,userCustId);
					boolean updateInvoiceLine = allUpdateDAO.invoiceLineUpdate(invoiceLineBean);

					InvoiceLineBean il = new InvoiceLineBean();
					il.setInvoice_line_id(invoice_line_id);

					System.out.println("line++" + invoice_line_id);

					SltlInvoiceLineBean slBean = allListDAO.detailsOfSltlLineByInvoiceLine(invoice_line_id);

					if (slBean != null) {
						int sltlInvoiceLineId = slBean.getSltl_invoice_line_id();

						SltlInvoiceLineBean sltlInvoiceLineBean = new SltlInvoiceLineBean(sltlInvoiceLineId,
								sltlMargine, sltlMarginAmt, new Date(), invoiceLineBean, userBean, sIBean, active);
						// boolean insertSltlInvoiceLine =
						// allInsertDAO.sltlinvoiceLineInsert(sltlInvoiceLineBean,userCustId);
						boolean updateSltlInvoiceLine = allUpdateDAO.sltlInvoiceLineUpdate(sltlInvoiceLineBean);
					} else {
						SltlInvoiceLineBean sltlInvoiceLineBean = new SltlInvoiceLineBean(sltlMargine, sltlMarginAmt,
								new Date(), invoiceLineBean, userBean, sIBean, active);
						boolean insertSltlInvoiceLine = allInsertDAO.sltlinvoiceLineInsert(sltlInvoiceLineBean,
								userCustId);
					}

				}

			}

		}

		final_outstanding = totalOutStanding - discount_amount;

		InvoiceBean i = allListDAO.detailsOfInvoice(invoiceid);

		int billed = i.getBilled();
		String bill_ref = i.getBill_ref();
		Date billedDate = i.getBill_date();

		InvoiceBean invoiceBean = new InvoiceBean(invoiceid, invoice_num, new Date(), new Date(), totalOutStanding,
				discount_per, discount_amount, final_outstanding, customer_code, main_customer_code, customerBean,
				userBean, customerTypeBean, currencyType, conversion, posting, postinDate, postingBy, vatRate, cgst,
				sgst, igst, billed, billedDate, bill_ref);
		boolean updateInvoice = allUpdateDAO.invoiceUpdate(invoiceBean);

		SltlinvoiceBean sltlinvoiceBean = new SltlinvoiceBean(sInvoiceid, sltl_invoice_num, new Date(),
				totalSltlOutStanding, 0, 0, totalSltlOutStanding, userBean, iBean, currencyType, conversion);
		boolean updateSltlInvoice = allUpdateDAO.sltlInvoiceUpdate(sltlinvoiceBean);

		return null;
	}

	// for redirect page using encode decode method apache base64
	@RequestMapping(value = "/getThreeDData", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String getThreeDData(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String dirpath = request.getParameter("path");
		String s = request.getParameter("dir");
		String id = request.getParameter("id");
		
		int count = 0;
		String jsonArray = "[";
		File file = new File(dirpath + "/" + s);

		String[] directoriessub = file.list(new FilenameFilter() {
			public boolean accept(File current, String name) {
				return new File(current, name).isDirectory();
			}
		});

		for (String subDir : directoriessub) {

			System.out.println("\t-" + subDir);

			File folder = new File("D:/dataOfStl/" + s + "/" + subDir);
			File[] listOfFiles = folder.listFiles();

			for (File filesub : listOfFiles) {
				if (filesub.isFile()) {

					String path = "D:/dataOfStl/" + s + "/" + subDir + "/" + filesub.getName();

					String ext = new GetExtension().getFileExtension(filesub);
					System.out.println("\t\t-" + path);

					if (ext.equalsIgnoreCase("stl")) {
						if (subDir.equalsIgnoreCase("Rough")) {
							System.err.println("--------------------Rough");
							
							String txt = "D:/dataOfStl/" + s + "/" + subDir + "/"
									+ filesub.getName().substring(0, filesub.getName().lastIndexOf(".")) + "_info.txt";
							String txtName = txt;
							String filename = path;
							String color = "#76D7C4";
							String scale = "10";
							String opacity = "0.1";
							jsonArray = jsonArray + "{\"id\":\"" + count + "\",\"filename\":\"" + filename
									+ "\",\"color\":\"" + color + "\",\"scale\":\"" + scale + "\",\"opacity\":\""
									+ opacity + "\",\"txtName\":\"" + txtName + "\"}";
							System.err.println("stl jsonArray :"+jsonArray);
						}

						if (subDir.equalsIgnoreCase("Polish")) {
							System.err.println("--------------------Polish");
							
							String txt = "D:/dataOfStl/" + s + "/" + subDir + "/"
									+ filesub.getName().substring(0, filesub.getName().lastIndexOf(".")) + "_lib.txt";
							String filename = path;
							String txtName = txt;
							String color = "#E74C3C";
							String scale = "10";
							String opacity = "1";
							jsonArray = jsonArray + "{\"id\":\"" + count + "\",\"filename\":\"" + filename
									+ "\",\"color\":\"" + color + "\",\"scale\":\"" + scale + "\",\"opacity\":\""
									+ opacity + "\",\"txtName\":\"" + txtName + "\"}";
							System.err.println("Polish jsonArray :"+jsonArray);
						}
						count++;
					}

				}
			}
		}

		if (id.equalsIgnoreCase("main")) {
			File folder = new File("D:/dataOfStl/INCLUSION");
			File[] listOfFiles = folder.listFiles();
			for (File filesub : listOfFiles) {
				if (filesub.isFile()) {
					String path = "D:/dataOfStl/INCLUSION/" + filesub.getName();
					String txtName = "";
					String filename = path;
					String color = "green";
					String scale = "10";
					String opacity = "0.2";
					jsonArray = jsonArray + "{\"id\":\"" + count + "\",\"filename\":\"" + filename + "\",\"color\":\""
							+ color + "\",\"scale\":\"" + scale + "\",\"opacity\":\"" + opacity + "\",\"txtName\":\""
							+ txtName + "\"}";
					System.err.println("INCLUSION jsonArray :"+jsonArray);
				}
			}
		}

		jsonArray = jsonArray.replace("}{", "},{");
		jsonArray = jsonArray + "]";

		System.out.println("jsonArray :"+jsonArray);

		return jsonArray;

	}

	// for redirect page using encode decode method apache base64
	@RequestMapping(value = "/readFile", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String readFile(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String dirpath = request.getParameter("path");

		File file = new File(dirpath);

		BufferedReader br = new BufferedReader(new FileReader(file));
		String str = "";
		String st = "";
		while ((st = br.readLine()) != null)
			str = str + "\n" + st;

		System.out.println("Chirag's Output:" + str);
		return str;

	}

	// for redirect page using encode decode method apache base64
	@RequestMapping(value = "/insertLog", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String insertLog(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String name = request.getParameter("name");
		String remark = request.getParameter("remark");
		String bundle_num = request.getParameter("bundle_num");

		BundleLogBean bundleLogBean = new BundleLogBean(remark, name, new Date(), bundle_num);

		boolean result = allInsertDAO.bundleLogInsert(bundleLogBean);

		response.sendRedirect("redirect?p=c3RvbmVMaXN0&bunNum=" + bundle_num + "&log=log");
		return null;
	}

	// for redirect page using encode decode method apache base64
	@RequestMapping(value = "/handoverInsert", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String handoverInsert(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {

		String custId = request.getParameter("custId");
		String name = request.getParameter("name");
		String PIDS = request.getParameter("PIDS");
		String SIDS = request.getParameter("SIDS");

		CustomerBean customerBean = new CustomerBean();
		customerBean.setCustomer_id(Integer.parseInt(custId));

		String handoverid = custId + "" + new SimpleDateFormat("yymmddhhmmsss").format(new Date());

		HandoverBean handoverBean = new HandoverBean(handoverid, new Date(), name, customerBean, PIDS);
		boolean handoverInsert = allInsertDAO.handoverInsert(handoverBean);

		String[] splitsid = SIDS.split(",");

		int i = 0;
		for (String s : splitsid) {
			Date returnDate = new SimpleDateFormat("yyyy-MM-dd").parse("1900-01-01");
			++i;
			WorkHistoryBean workHistoryBean = new WorkHistoryBean();
			workHistoryBean.setWork_history_id(s);

			String handoverStoneid = custId + "" + i + "" + new SimpleDateFormat("yymmddhhmmsss").format(new Date());
			HandoverStoneBean handoverStoneBean = new HandoverStoneBean(handoverStoneid, "assign", new Date(),
					returnDate, workHistoryBean, handoverBean, "-");
			boolean handoverStoneInsert = allInsertDAO.handoverStoneInsert(handoverStoneBean);
		}

		response.sendRedirect("redirect?p=aGFuZG92ZXJQcm9jZXNz");

		return null;
	}

	// for redirect page using encode decode method apache base64
	@RequestMapping(value = "/updateHandoverStatus", method = RequestMethod.GET) // Mapping for Call the controller
	@ResponseBody
	public String updateHandoverStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String id = request.getParameter("id");
		String action = request.getParameter("action");

		boolean updateStatus = allUpdateDAO.handoverStatusUpdate(id, action, new Date());

		String returndate = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa").format(new Date());

		return returndate;
	}

	// for redirect page using encode decode method apache base64
	@RequestMapping(value = "/deleteHandover", method = RequestMethod.GET) // Mapping for Call the controller
	@ResponseBody
	public String deleteHandover(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String id = request.getParameter("id");

		boolean updateStatus = allDeleteDAO.deleteHandover(id);

		return null;
	}

	// for redirect page using encode decode method apache base64
	@RequestMapping(value = "/deleteChallanLine", method = RequestMethod.GET) // Mapping for Call the controller
	@ResponseBody
	public String deleteChallanLine(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String challanId = request.getParameter("challanId");
		String wId = request.getParameter("wId");
		int userId = Integer.parseInt(request.getParameter("uid"));

		boolean updateStatus = allDeleteDAO.deleteChallanLine(challanId);
		boolean updateStockStatus = allUpdateDAO.updateWorkStockStatus(wId, userId, 0);

		List<WorkHistoryBean> listOfChildWork = allListDAO.listOfWorkHistoryByParentWorkId(wId);

		for (WorkHistoryBean ww : listOfChildWork) {
			updateStockStatus = allUpdateDAO.updateWorkStockStatus(ww.getWork_history_id(), userId, 0);
		}

		return null;
	}

	// for redirect page using encode decode method apache base64
	@RequestMapping(value = "/updateHandover", method = RequestMethod.GET) // Mapping for Call the controller
	@ResponseBody
	public String updateHandover(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String hid = request.getParameter("hid");

		boolean updateStatus = allUpdateDAO.updateHandoverName(hid, name);

		return null;
	}

	// for split data
	@RequestMapping(value = "/splitData", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public int splitData(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("SIDS");
		System.out.println(name);
		String[] arr = name.split(",");
		System.out.println("======" + arr.length);

		return arr.length;
	}

	// for redirect page using encode decode method apache base64
	@RequestMapping(value = "/updateHandoverRemark", method = RequestMethod.GET) // Mapping for Call the controller
	@ResponseBody
	public String updateHandoverRemark(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String remark = request.getParameter("remark");
		String hsid = request.getParameter("hsid");

		boolean updateStatus = allUpdateDAO.updateHandoverStoneRemark(hsid, remark);

		return null;
	}

	@RequestMapping(value = "/insertChildWork", method = RequestMethod.POST) // Mapping for Call the controller
	public String insertChildWork(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {

		String stoneNum = request.getParameter("stoneNum");
		int uid = Integer.parseInt(request.getParameter("uId"));
		String parent_id = request.getParameter("parentId");

		WorkHistoryBean ww = allListDAO.workHistoryId(parent_id);

		int custId = ww.getCustomerBean().getCustomer_id();
		String kapanName = ww.getKapan_name();
		String lotName = ww.getLot_name();
		String priority = ww.getPriority();
		String clearity = ww.getClearity();
		String stoneName = ww.getStone_name();
		String color = ww.getColor();
		String remarks = ww.getRemarks();
		int pId = ww.getProductMasterBean().getProduct_master_id();

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date insertDate = new Date();
		Date startDate = simpleDateFormat.parse("1900-01-01");
		Date completinDate = simpleDateFormat.parse("1900-01-01");
		Date deactiveDate = simpleDateFormat.parse("1900-01-01");
		Date instockDate = simpleDateFormat.parse("1900-01-01");
		Date clearedDate = simpleDateFormat.parse("1900-01-01");

		String bundleNum = ww.getBundle_num();
		int active = 1;
		int status = 1;
		int in_stock = 0;

		CustomerBean customerBean = new CustomerBean();
		customerBean.setCustomer_id(custId);

		UserBean userBean = new UserBean();
		userBean.setUser_id(uid);

		ProductMasterBean productMasterBean = new ProductMasterBean();
		productMasterBean.setProduct_master_id(pId);

		StatusBean statusBean = new StatusBean();
		statusBean.setStatus_id(status);

		List<WorkProductBean> listOfWorkProduct = allListDAO.listOfWorkProduct(parent_id);

		int scount = 0;
		try {
			scount = Integer.parseInt(stoneNum);
		} catch (Exception e) {
			// TODO: handle exception
		}

		if (scount != 0) {
			String[] aweight = request.getParameterValues("childWeight");

			for (String cWeight : aweight) {
				String actualWeight = cWeight.trim();

				if (!cWeight.equalsIgnoreCase("") && !cWeight.equalsIgnoreCase("0")) {

					WorkHistoryBean workHistoryBean = new WorkHistoryBean(kapanName, lotName, actualWeight, stoneName,
							priority, color, clearity, insertDate, startDate, completinDate, "-", productMasterBean,
							customerBean, active, deactiveDate, "-", statusBean, remarks, userBean, in_stock,
							instockDate, 0, parent_id, clearedDate, bundleNum);
					boolean result = allInsertDAO.workInsert(workHistoryBean, custId);
					String wId = workHistoryBean.getWork_history_id();

					for (WorkProductBean wp : listOfWorkProduct) {

						int p_id = wp.getProductMasterBean().getProduct_master_id();

						System.out.println(wp.getProductMasterBean().getProduct_name());

						String customer_code = ww.getCustomerBean().getCustomer_code();

						WorkHistoryBean w = new WorkHistoryBean();
						w.setWork_history_id(wId);

						ProductMasterBean p = new ProductMasterBean();
						p.setProduct_master_id(p_id);

						WorkProductBean workProductBean = new WorkProductBean(new Date(), customer_code, p, w, 1);
						boolean workProductInsert = allInsertDAO.workProductInsert(workProductBean, custId);
						String wpId = workProductBean.getWork_product_id();
						WorkProductBean wpb = new WorkProductBean();
						wpb.setWork_product_id(wpId);

						List<ProductProcessBean> listOfProcess = allListDAO.listOfProductProcess(p_id);

						for (ProductProcessBean psb : listOfProcess) {

							int psId = psb.getProduct_process_id();

							ProductProcessBean productProcessBean = new ProductProcessBean();
							productProcessBean.setProduct_process_id(psId);

							Date defaultDate = simpleDateFormat.parse("1900-01-01");

							WorkProductProcessBean workProductProcessBean = new WorkProductProcessBean(customer_code,
									new Date(), defaultDate, defaultDate, "-", "-", 1, "-", w, wpb, productProcessBean,
									kapanName, lotName, stoneName, psb.getProduct_process_name(), 1, actualWeight,
									priority, color, clearity);
							boolean workProductProcessInsert = allInsertDAO
									.workProductProcessInsert(workProductProcessBean, custId);
						}

					}

				}
			}

		}

		return null;
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST) // Mapping for Call the controller
	public String addUser(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String name = request.getParameter("name");
		String username = request.getParameter("username");
		int authority = 4; // User
		String password = request.getParameter("password");
		int parentId = Integer.parseInt(request.getParameter("parentId"));

		String encodePassword = new AESEncrypt().encrypt(password);

		CustomerBean c = allListDAO.customerDetails(parentId);
		int custId = c.getCustomer_id();
		String cCode = c.getCustomer_code();

		int active = 1;

		UserBean operatorUser = new UserBean(name, username, encodePassword, new Date(), active, cCode, authority,
				custId);
		boolean insertOperator = allInsertDAO.userInsert(operatorUser);

		String encode = new EncodeDecode().encodeString(String.valueOf(parentId));
		response.sendRedirect("redirect?p=dXNlckxpc3Q=&cId=" + encode);

		return null;
	}

	@RequestMapping(value = "/updateBillDetail", method = RequestMethod.POST) // Mapping for Call the controller
	public String updateBillDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String iid = request.getParameter("iid");
		String bDate = request.getParameter("bDate");
		String bRef = request.getParameter("bRef");

		SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy");
		Date billDate = s.parse(bDate);

		boolean updateBillDetail = allUpdateDAO.invoiceBillDetailUpdate(iid, billDate, bRef, 1);
		System.out.println(updateBillDetail);
		return null;
	}

	@RequestMapping(value = "/checkDate", method = RequestMethod.POST) // Mapping for Call the controller
	@ResponseBody
	public String checkDate(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String date = request.getParameter("date");

		SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy");

		String output = "false";

		try {
			Date billDate = s.parse(date);
			output = "false";
		} catch (Exception e) {
			// TODO: handle exception
			output = "true";
		}

		response.getWriter().print(output);

		return null;
	}

	@RequestMapping(value = "/insertPayment", method = RequestMethod.POST) // Mapping for Call the controller
	public String insertPayment(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int custId = Integer.parseInt(request.getParameter("custId"));
		String receiveDate = request.getParameter("receiveDate");
		double amount = Double.parseDouble(request.getParameter("amount"));
		String remark = request.getParameter("remark");

		SimpleDateFormat ddmmyyyy = new SimpleDateFormat("dd/MM/yyyy");

		Date parseReceiveDate = ddmmyyyy.parse(receiveDate);

		CustomerBean customerBean = new CustomerBean();
		customerBean.setCustomer_id(custId);

		PaymentBean paymentBean = new PaymentBean(new Date(), amount, remark, parseReceiveDate, customerBean);
		boolean insertPayment = allInsertDAO.paymentInsert(paymentBean);

		response.sendRedirect("redirect?p=aW52b2ljZUxpc3Q=&userCustId="
				+ new EncodeDecode().encodeString(String.valueOf(custId)) + "&status=MA==&paymentFlag=true");

		return null;
	}

	@RequestMapping(value = "/deletePaymentData", method = RequestMethod.GET) // Mapping for Call the controller
	public String deletePaymentData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String pid = request.getParameter("pid");

		boolean deleteData = allDeleteDAO.deleteayment(pid);

		return null;
	}

	@RequestMapping(value = "/deactiveInvoice", method = RequestMethod.GET) // Mapping for Call the controller
	public String deactiveInvoice(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String invoiceId = request.getParameter("invoiceId");

		System.out.println("=====" + invoiceId);
		int active = 0;

		boolean result1  = allDeleteDAO.deleteInvoiceLine(invoiceId);
		
		if(true) {
		
		boolean result  = allDeleteDAO.deleteInvoice(invoiceId);
		System.out.println(result);
		}

		response.sendRedirect("redirect?p=aW52b2ljZUxpc3Q=");

		return null;
	}
	
}
