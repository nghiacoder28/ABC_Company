package controller.plan;

import controller.accesscontrol.BaseRBACController;
import dal.PlanDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Plan;
import model.accesscontrol.User;

public class PlanDeleteController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        int planId = Integer.parseInt(request.getParameter("planId"));

        Plan plan = new Plan();
        plan.setPlid(planId);

        PlanDBContext planDB = new PlanDBContext();
        planDB.delete(plan);

        response.sendRedirect(request.getContextPath() + "/productionplan/list");
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        // POST không cần xử lý cho chức năng xóa
    }
}
