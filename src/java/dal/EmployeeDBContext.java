package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee;
import model.accesscontrol.User;

public class EmployeeDBContext extends DBContext<Employee> {

    // Method to get department ID based on username
    public int getDepartmentIdByUsername(String username) {
        int did = -1; // Default value if not found
        try {
            String sql = "SELECT [did]\n"
                    + "  FROM [dbo].[Employee] e\n"
                    + "  Join User_Employee us on e.eid = us.eid\n"
                    + "  Join [User] u on us.username = u.username\n"
                    + "  where u.username = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                did = rs.getInt("did");
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return did;
    }

    // Method to list employees based on logged user's department ID
    public ArrayList<Employee> listByLoggedUser(User loggeduser) {
        ArrayList<Employee> employees = new ArrayList<>();
        int did = getDepartmentIdByUsername(loggeduser.getUsername()); // Get department ID

        if (did == -1) {
            // Department ID not found, return empty list
            return employees;
        }

        try {
            String sql = "SELECT eid, ename, salaryLevel FROM Employee WHERE did = ? and eid LIKE 'CN%'";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, did);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Employee employee = new Employee();
                employee.setEid(rs.getString("eid"));
                employee.setEname(rs.getString("ename"));
                employee.setSalaryLevel(rs.getString("salaryLevel"));
                employees.add(employee);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employees;
    }
}
