/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.Locale;

public class ToVietnameseDateTag extends SimpleTagSupport {
    private Date value;

    public void setValue(Date value) {
        this.value = value;
    }

    @Override
    public void doTag() throws JspException, IOException {
        if (value != null) {
            SimpleDateFormat formatter = new SimpleDateFormat("'Ngày' dd 'Tháng' MM 'Năm' yyyy", new Locale("vi", "VN"));
            String formattedDate = formatter.format(value);
            getJspContext().getOut().write(formattedDate);
        }
    }
}
