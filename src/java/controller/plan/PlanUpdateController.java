package controller.plan;

import dal.PlanDBContext;
import dal.ProductDBContext;
import model.Plan;
import model.PlanCampaign;
import model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

public class PlanUpdateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int plid = Integer.parseInt(request.getParameter("plid"));
        PlanDBContext planDB = new PlanDBContext();
        Plan plan = planDB.get(plid);

        if (plan != null) {
            request.setAttribute("plan", plan);
            request.getRequestDispatcher("/view/plan/update.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Plan not found with ID: " + plid);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int plid = Integer.parseInt(request.getParameter("plid"));
            Date startDate = Date.valueOf(request.getParameter("startd"));
            Date endDate = Date.valueOf(request.getParameter("endd"));
            int did = Integer.parseInt(request.getParameter("did"));

            // Tạo đối tượng Plan và cập nhật các thuộc tính
            Plan plan = new Plan();
            plan.setPlid(plid);
            plan.setStartd(startDate);
            plan.setEndd(endDate);
            plan.getDepartment().setDid(did);

            // Lấy danh sách các chiến dịch mới từ form
            ArrayList<PlanCampaign> campaigns = new ArrayList<>();
            ProductDBContext productDB = new ProductDBContext();

            for (String pid : request.getParameterValues("productID")) {
                PlanCampaign campaign = new PlanCampaign();
                Product product = productDB.get(Integer.parseInt(pid));
                campaign.setProduct(product);
                campaign.setQuantity(Integer.parseInt(request.getParameter("quantity_" + pid)));
                campaign.setEstimatedeffort(Float.parseFloat(request.getParameter("estimatedeffort_" + pid)));
                campaign.setPlan(plan);
                campaigns.add(campaign);
            }

            // Thiết lập danh sách chiến dịch cho plan
            plan.setCampaigns(campaigns);

            // Gọi hàm update từ PlanDBContext
            PlanDBContext planDB = new PlanDBContext();
            planDB.update(plan);

            // Chuyển hướng lại trang danh sách kế hoạch sản xuất sau khi cập nhật thành công
            response.sendRedirect(request.getContextPath() + "/productionplan/list");
         
    }
}
