package com.servlet;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.impl.OrderServiceImpl;
import com.service.inter.OrderService;
import com.util.PaymentUtil;





public class PaymentServlet extends HttpServlet {
	
	String orderNo =null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("doGet".equals(action)){
			String target = "/WEB-INF/jsp/user/page-payment/payment.jsp";
			request.getRequestDispatcher(target).forward(request, response);
		}else if("paymentPre".equals(action)){
			this.paymentPre(request, response);
		}else if("payment".equals(action)){
			this.payment(request, response);
		}else if("back".equals(action)){
			this.back(request, response);
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
	
	
	/*֧��׼��*/
	
	public void paymentPre(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String target = "";
		request.getRequestDispatcher(target).forward(request, response);
	}

	 /*֧������*/
	
	public String payment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("*****zhifu**");
		orderNo = request.getParameter("orderNo");
		Properties props = new Properties();
		props.load(this.getClass().getClassLoader().getResourceAsStream("payment.properties"));
		
		System.out.println("in PaymentServlet.java payment");
		
		/*
		 * 1. ׼��13������
		 */
		String p0_Cmd = "Buy";//ҵ�����ͣ��̶�ֵBuy
		String p1_MerId = props.getProperty("p1_MerId");//�̺ű��룬���ױ���Ψһ��ʶ
		String p2_Order = orderNo;//��������
		String p3_Amt = "0.01";//֧�����
		String p4_Cur = "CNY";//���ױ��֣��̶�ֵCNY
		String p5_Pid = "iphone";//��Ʒ����
		String p6_Pcat = "";//��Ʒ����
		String p7_Pdesc = "";//��Ʒ����
		String p8_Url = props.getProperty("p8_Url");//��֧���ɹ����ױ�����������ַ��
		String p9_SAF = "";//�ͻ���ַ
		String pa_MP = "";//��չ��Ϣ
		String pd_FrpId = "CCB-NET-B2C";//"ICBC-NET-B2C" ;//"ABC-NET-B2C";////request.getParameter("");//֧��ͨ��
		String pr_NeedResponse = "1";//Ӧ����ƣ��̶�ֵ1
		
		/*
		 * 2. ����hmac
		 * ��Ҫ13������
		 * ��ҪkeyValue
		 * ��Ҫ�����㷨
		 */
		String keyValue = props.getProperty("keyValue");
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
				p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
				pd_FrpId, pr_NeedResponse, keyValue);
		
		/*
		 * 3. �ض����ױ���֧������
		 */
		StringBuilder sb = new StringBuilder("https://www.yeepay.com/app-merchant-proxy/node");
		sb.append("?").append("p0_Cmd=").append(p0_Cmd);
		sb.append("&").append("p1_MerId=").append(p1_MerId);
		sb.append("&").append("p2_Order=").append(p2_Order);
		sb.append("&").append("p3_Amt=").append(p3_Amt);
		sb.append("&").append("p4_Cur=").append(p4_Cur);
		sb.append("&").append("p5_Pid=").append(p5_Pid);
		sb.append("&").append("p6_Pcat=").append(p6_Pcat);
		sb.append("&").append("p7_Pdesc=").append(p7_Pdesc);
		sb.append("&").append("p8_Url=").append(p8_Url);
		sb.append("&").append("p9_SAF=").append(p9_SAF);
		sb.append("&").append("pa_MP=").append(pa_MP);
		sb.append("&").append("pd_FrpId=").append(pd_FrpId);
		sb.append("&").append("pr_NeedResponse=").append(pr_NeedResponse);
		sb.append("&").append("hmac=").append(hmac);
		
		response.sendRedirect(sb.toString());
		return null;
	}
	
	
	/* * ��������
	 * ��֧���ɹ�ʱ���ױ����������
	 * �����ַ������ʣ�
	 * 1. �����û���������ض���(����û��ر�����������Ͳ��ܷ���������)
	 * 2. �ױ��ķ�������ʹ�õ�Ե�ͨѶ�ķ�������������������������success����Ȼ�ױ���������һֱ�������������*/
	
	public String back(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. ��ȡ12������
		 */
		String p1_MerId = request.getParameter("p1_MerId");
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");
		String r2_TrxId = request.getParameter("r2_TrxId");
		String r3_Amt = request.getParameter("r3_Amt");
		String r4_Cur = request.getParameter("r4_Cur");
		String r5_Pid = request.getParameter("r5_Pid");
		String r6_Order = request.getParameter("r6_Order");
		String r7_Uid = request.getParameter("r7_Uid");
		String r8_MP = request.getParameter("r8_MP");
		String r9_BType = request.getParameter("r9_BType");
		String hmac = request.getParameter("hmac");
		/*
		 * 2. ��ȡkeyValue
		 */
		Properties props = new Properties();
		props.load(this.getClass().getClassLoader().getResourceAsStream("payment.properties"));
		String keyValue = props.getProperty("keyValue");
		/*
		 * 3. ����PaymentUtil��У�鷽����У������ߵ����
		 *   >���У��ʧ�ܣ����������Ϣ��ת����msg.jsp
		 *   >���У��ͨ����
		 *     * �жϷ��ʵķ������ض����ǵ�Ե㣬���Ҫ���ض���
		 *     �޸Ķ���״̬������ɹ���Ϣ��ת����msg.jsp
		 *     * ����ǵ�Ե㣺�޸Ķ���״̬������success
		 */
		boolean bool = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId,
				r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType,
				keyValue);
		if(!bool) {
			request.setAttribute("code", "error");
			request.setAttribute("msg", "֧��ʧ�ܣ�");
			
		}
		System.out.println("����ģʽһ");
		if(r1_Code.equals("1")) {
			//orderService.updateStatus(r6_Order, 2);
			if(r9_BType.equals("1")) {
				
				OrderService service = new OrderServiceImpl();
				try {
					service.updateZTByOid(orderNo);
				} catch (Exception e) {
					System.out.println(e.getMessage());
					e.printStackTrace();
				}
				
				String target = "/WEB-INF/jsp/user/zhifuchenggong.jsp";
				request.getRequestDispatcher(target).forward(request, response);
			} else if(r9_BType.equals("2")) {
				//response.getWriter().print("success");
				request.setAttribute("msg", "success");
				String target = "/WEB-INF/msg.jsp";
				request.getRequestDispatcher(target).forward(request, response);
			}
		}
		return null;
	}

}
