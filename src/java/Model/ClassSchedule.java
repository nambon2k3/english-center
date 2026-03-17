package Model;

import lombok.*;
import lombok.experimental.SuperBuilder;
import java.time.format.DateTimeFormatter;
import java.time.LocalTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@ToString(callSuper = true)
public class ClassSchedule extends BaseModel {

    private Integer classId;

    // 1 = Monday, 2 = Tuesday
    private Integer dayOfWeek;

    private LocalTime startTime;

    private LocalTime endTime;

    public String getStartTimeInput() {
        return startTime != null
                ? startTime.format(DateTimeFormatter.ofPattern("HH:mm"))
                : "";
    }

    public String getEndTimeInput() {
        return endTime != null
                ? endTime.format(DateTimeFormatter.ofPattern("HH:mm"))
                : "";
    }
}
