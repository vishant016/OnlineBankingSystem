package g;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class date {

    public static Date Date1(Date x) {

        Calendar c = Calendar.getInstance();
        c.setTime(x);
        int currMonth = c.get(Calendar.MONTH);

        c.set(Calendar.MONTH, currMonth + 1);

        // convert calendar to date
        Date currentDatePlusOne = c.getTime();

        return currentDatePlusOne;
    }

    public static String Date2(Date x) {
        Calendar cal = Calendar.getInstance();

        cal.setTime(x);

        int currMonth1 = cal.get(Calendar.MONTH);

        cal.set(Calendar.MONTH, currMonth1 + 1);

        // convert calendar to date
        Date currentDatePlusOne1 = cal.getTime();

        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

        String date1 = format1.format(currentDatePlusOne1);

        return date1;

    }
}
