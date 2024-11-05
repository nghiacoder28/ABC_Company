package controller.plan;

import controller.accesscontrol.BaseRBACController;
import dal.PlanDBContext;
import dal.ScheduleCampaignDBContext;
import model.Plan;
import model.ScheduleCampaign;
import model.accesscontrol.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

public class ProductionPlanListController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        PlanDBContext planDB = new PlanDBContext();
        ArrayList<Plan> plans = planDB.list();

        // Calculate status for each plan based on completed campaigns
        ScheduleCampaignDBContext scheduleDB = new ScheduleCampaignDBContext();
        for (Plan plan : plans) {
            ArrayList<ScheduleCampaign> completedCampaigns = scheduleDB.getScheduleCampaignsByPlanId(plan.getPlid());
            plan.calculateStatus(completedCampaigns);
        }

        request.setAttribute("plans", plans);
        request.getRequestDispatcher("/plan/plan_list.jsp").forward(request, response);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        // Currently, no operations are defined for POST in this controller.
    }

}
