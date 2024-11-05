/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.accesscontrol.Feature;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Minh Duc
 */
public class FeatureDBContext extends DBContext<Feature> {

    public ArrayList<Feature> get(String username) {

        ArrayList<Feature> features = new ArrayList<>();

        String url = "SELECT f.featureId\n"
                + "      ,f.featureName\n"
                + "      ,f.url\n"
                + "   FROM [Feature] f\n"
                + "   INNER JOIN RoleFeature rf on f.featureId = rf.featureId\n"
                + "   INNER JOIN UserRole us on rf.roleId = us.roleId\n"
                + "   WHERE us.username = ?";
        PreparedStatement stm = null;

        try {
            stm = connection.prepareStatement(url);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feature ft = new Feature();
                ft.setId(rs.getInt("featureId"));
                ft.setName(rs.getNString("featureName"));
                ft.setUrl(rs.getNString("url"));
                features.add(ft);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeatureDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(FeatureDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        return features;
    }

}
