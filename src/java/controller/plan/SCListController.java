package controller.plan;

import controller.accesscontrol.BaseRBACController;
import dal.DepartmentDBContext;
import dal.ScheduleCampaignDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ScheduleCampaign;
import model.accesscontrol.User;

import java.io.IOException;
import java.util.ArrayList;

public class SCListController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        int plid = Integer.parseInt(request.getParameter("plid"));
        ScheduleCampaignDBContext scheduleDB = new ScheduleCampaignDBContext();
        ArrayList<ScheduleCampaign> scheduleCampaigns = scheduleDB.getScheduleCampaignsByPlanId(plid);

        DepartmentDBContext dDB = new DepartmentDBContext();
        String departmentName = dDB.getDepartmentNameByPlanId(plid);

        request.setAttribute("departmentName", departmentName);
        request.setAttribute("scheduleCampaigns", scheduleCampaigns);
        request.setAttribute("plid", plid);

        request.getRequestDispatcher("/schedulecampaign/scampaign_list.jsp").forward(request, response);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        // Currently, no operations are defined for POST in this controller.
    }

}
