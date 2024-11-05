package controller.accesscontrol;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.accesscontrol.User;
import java.io.IOException;

public class HomeController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User loggeduser) throws ServletException, IOException {
        // Xử lý logic cho trang chủ khi người dùng đã có quyền truy cập
        req.setAttribute("user", loggeduser);
        req.getRequestDispatcher("/home.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User loggeduser) throws ServletException, IOException {
        // Chức năng POST không áp dụng cho HomeController trong ví dụ này
        resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "POST not supported on this resource");
    }
}
