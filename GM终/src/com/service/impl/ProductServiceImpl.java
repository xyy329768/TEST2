package com.service.impl;

import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;







import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dao.impl.ProductDaoImpl;
import com.dao.inter.ProductDao;
import com.page.PageInfo;
import com.service.inter.ProductService;
import com.vo.Category2;
import com.vo.Product;

public class ProductServiceImpl implements ProductService{

	private ProductDao dao;
	
	public ProductServiceImpl(){
		
		dao = new ProductDaoImpl();	
	}
	
	public int addProduct(Product product) throws Exception{
		
		int count = dao.addProduct(product);
		return count;
	}
	//����ɾ��
	public int deleteProductByIdSelect(String[] pids) throws Exception {
		Product product = new Product();
		int count=0;
		for(String pid:pids){
			ProductDao dao =new ProductDaoImpl();
			product.setPid(new Integer(pid));
			count = dao.deleteProduct(product);
		}
		return count;
	}
	@Override
	public int getTotalRecordCount() throws Exception {
		int totalRecordCount = -1;
		String sql = "select count(*) from product";
		totalRecordCount = dao.getTotalRecordSum(sql);
		return totalRecordCount;
	}

	@Override
	public List<Product> getAllCategorysByPage(PageInfo pageInfo)
			throws Exception {
		List<Product> list = null;	
		String sql = "select * FROM (select c.*,rownum r from (SELECT * FROM product p INNER JOIN category2 c2 ON(p.sfid=c2.sid)) c) WHERE r>="+pageInfo.getBegin()+ "and r<="+pageInfo.getEnd();
		list = dao.getPageByQuery(sql);
		return list;
	}

	@Override
	public int getTotalRecordCount(Product product) throws Exception {
		int totalRecordCount = -1;
		
		String sql = "select count(*) from product where sfid="+product.getCid();
		totalRecordCount = dao.getTotalRecordSum(sql);
		return totalRecordCount;
	}

	@Override
	public int getAllTotalRecordCount(Product product) throws Exception {
		int totalRecordCount = -1;
		
		StringBuffer sb = new StringBuffer("select count(*) from product p INNER JOIN category2 c2 ON(p.sfid=c2.sid)  where 1=1");
		
		String pname = product.getPname();
		
		String dianpuName = product.getDianpuName();
	
		String parentcname = product.getCategory().getCname();
		

		if (pname != null && !pname.trim().equals("")) {

			sb.append(" and pname='");
			sb.append(pname);
			sb.append("'");
		}

		if (dianpuName != null && !dianpuName.trim().equals("")) {
			sb.append(" or dianpuName like '%");
			sb.append(dianpuName);
			sb.append("%'");
		}
		if(parentcname!=null && !parentcname.trim().equals("")){
			sb.append(" or sname = '");
			sb.append(parentcname);
			sb.append("'");
		}
		
		String sql = sb.toString();
		System.out.println(sql);
		totalRecordCount = dao.getTotalRecordSum(sql);
		return totalRecordCount;
	}

	@Override
	public List<Product> getPageByQuery(Product product, PageInfo pageInfo)
			throws Exception {
		List<Product> list = null;
		//sql=SELECT * FROM (SELECT c.*,rownum r from (SELECT * FROM (category2 c2  inner join category c1  ON ��c2.fid=c1.cid��)where 1=1 and sname='���õ���' or sdesc like '%���õ���%' or cname = '���õ���')c) where r>=1 and r<=5;
		StringBuffer sb = new StringBuffer(
				"SELECT * FROM (SELECT c.*,rownum r from (SELECT * FROM (product p INNER JOIN category2 c2 ON(p.sfid=c2.sid))where 1=1");

		String pname = product.getPname();
		
		String dianpuName = product.getDianpuName();
	
		String parentcname = product.getCategory().getCname();
		
		if (pname != null && !pname.trim().equals("")) {

			sb.append(" and pname='");
			sb.append(pname);
			sb.append("'");
		}

		if (dianpuName != null && !dianpuName.trim().equals("")) {
			sb.append(" or dianpuName like '%");
			sb.append(dianpuName);
			sb.append("%'");
		}
		if(parentcname!=null && !parentcname.trim().equals("")){
			sb.append(" or sname = '");
			sb.append(parentcname);
			sb.append("'");
		}
		sb.append(")c) where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());
		String sql = sb.toString();
		System.out.println(sql);
		list = dao.getPageByQuery(sql);
		return list;
	}

	@Override
	public int deleteCategoryByCid(String cid) throws Exception {
		Product product = new Product();
		product.setPid(Integer.parseInt(cid));
		int count= dao.deleteProduct(product);
		return count;
	}

	@Override
	public Product getOne(String cid) throws Exception {
		Product	product = null;
		ProductDao dao =new ProductDaoImpl();
		product = dao.getProductById(Integer.parseInt(cid));
		return product;
	}
	
	@Override
	public int updateCategory(Product product) throws Exception {
		int count = dao.updateProduct(product);
		return count;
	}

	@Override
	public int ProductUpDown(Product product) throws Exception {
		
		int count = dao.updateProductUpDown(product);
		return count;
	}

	@Override
	public void upload(HttpServletRequest request, String productListUploadPath)
			throws Exception {
		String pid ="";
		DiskFileItemFactory itemFactory = new DiskFileItemFactory();//�����ڴ滺��������ֵ512k
		itemFactory.setSizeThreshold(0x80000);
		File temDir = new File("D:\\LinShi");//�����½��ļ�
		if(!temDir.exists()){
			temDir.mkdirs();
		}
		itemFactory.setRepository(temDir);//������ʱ�洢�ļ���Ŀ¼
		ServletFileUpload fileUpload = new ServletFileUpload(itemFactory);
		fileUpload.setSizeMax(0xA00000);//�����ϴ��ļ������������Ϊ10M
		List<String> fileNameList = new ArrayList<String>();//���ļ���
		try{
			List<FileItem> fileItems = fileUpload.parseRequest(request);
			Iterator<FileItem> it = fileItems.iterator();
			boolean flag = true;
			while(it.hasNext()){
				FileItem item = it.next();//�ж��Ƿ����ļ���
				if(!item.isFormField()){
					//���ļ�
					String name = item.getName();
					long size = item.getSize();
					if(name==null || name.equals("") && size==0){
						fileNameList.add("");
						continue;
					}
					if(flag){
						productListUploadPath = productListUploadPath + "\\product" +pid;
						flag= false;
					}
					File uploadFileDir = new File(productListUploadPath);
					if(!uploadFileDir.exists()){
						uploadFileDir.mkdirs();
					}
					// �����������͵��ļ�����ȫ·��������ȡ���ļ���
					// ͼƬ���������_��ǰʱ�����1970�������_�����1_�����2
					// d:\\......\\1.jpg
					int index = name.lastIndexOf(File.separator);
					if(index >0){
						name = name.substring(index+1, name.length());
					}
					System.out.println("*********look here*********");

					long currentTime = System.currentTimeMillis();

					Random random = new Random();

					int num1 = random.nextInt(10000);
					int num2 = random.nextInt(10000);

					int dotPosition = name.lastIndexOf(".");

					String fileBeginName = name.substring(0, dotPosition);
					String fileEndName = name.substring(dotPosition);
					name = fileBeginName + "_" + currentTime + "_" + num1 + "_"
							+ num2 + fileEndName;

					System.out.println("afterName=" + name);
					fileNameList.add(name);

					File file = new File(uploadFileDir, name);
					item.write(file);// �ϴ��ļ� ����һ��
				}else{
					System.out.println("�����ļ� ����ͨ�ı���");
					// �õ����з��ļ��� �ı���,�����ı����,����õ�pid �� pname �������ı����ֵ
					String fieldName = item.getFieldName();
					String value = item.getString("utf-8");
					System.out.println("fieldName=" + fieldName);
					System.out.println("value=" + value);
					if ("pid".equals(fieldName)) {
						pid = value;
					}
				}
				
			}
			
		}catch(FileUploadException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		for(String str : fileNameList){
			System.out.println(str);
		}
		//----------���ϴ����ļ����浽���ݿ���--------
		List<String> fileNameWithDirectoryList = new ArrayList<String>();//���ļ��е��ļ��� ���� product2\\ͼƬ��
		for(String fileName:fileNameList){
			
			String fileNameWithDirectory = "";
			
			if(!fileName.trim().equals("")){
				 fileNameWithDirectory = "product" + pid + "\\" + fileName;
			}
			
			fileNameWithDirectoryList.add(fileNameWithDirectory);
			
		}
		
		ProductServiceImpl service2 = new ProductServiceImpl();
		service2.saveImagePathInTable(pid, fileNameWithDirectoryList);
		
	}

	public void saveImagePathInTable(String pid,
			List<String> fileNameList) throws Exception{
		System.out.println("fileNameList size=" + fileNameList.size());
		
		//�Ȱ���ǰ�Ĳ����
		Product product;
		try {
			product = dao.getProductById(Integer.parseInt(pid));
		} catch (Exception e1) {
			e1.printStackTrace();
			throw new Exception("������ƷͼƬ·��ʱ ��ѯ��һ��Ʒʧ��!");
		
		}

		ProductDaoImpl dao2 = new ProductDaoImpl();

		String[] imgNameArr = {"ProductListLargeImage1","ProductListLargeImage2","ProductListLargeImage3","ProductListSmallImage1","ProductListSmallImage2","ProductListSmallImage3","DetailLargeImg1","DetailLargeImg2","DetailLargeImg3","DetailLargeImg4","DetailLargeImg5","DetailSmallImg1","DetailSmallImg2","DetailSmallImg3","DetailSmallImg4","DetailSmallImg5","ShoppingCarImg"};
		
		//ʹ�÷�����÷���
		Class<?> clazz = product.getClass();
		
		for(int i=0;i<imgNameArr.length;i++){
			String imgName = fileNameList.get(i);
			
			if (imgName != null
					&& !imgName.trim().equals("")) {
				
				String methodName = "set" + imgNameArr[i];
				
				try{
					Method method = clazz.getMethod(methodName,String.class);
					method.invoke(product, imgName);
					System.out.println("����һ��");
				}catch(Exception e){
					e.printStackTrace();
				}
				
				//product.setProductListLargeImage(imgName);
			}
			
		}
		


		/*String productListSmallImage1 = fileNameList.get(1);

		if (productListSmallImage1 != null
				&& !productListSmallImage1.trim().equals("")) {
			product.setProductListSmallImage1(productListSmallImage1);
		}

		String productListSmallImage2 = fileNameList.get(2);

		if (productListSmallImage2 != null
				&& !productListSmallImage2.trim().equals("")) {
			product.setProductListSmallImage2(productListSmallImage2);
		}

		String productListSmallImage3 = fileNameList.get(3);

		if (productListSmallImage3 != null
				&& !productListSmallImage3.trim().equals("")) {
			product.setProductListSmallImage3(productListSmallImage3);
		}*/
		
		//������ϸҳͼƬ���Ƶ�ָ���ֶ�
		dao2.updateProductImageNames(product);
		
	}

}
