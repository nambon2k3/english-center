package Model;

import lombok.*;
import lombok.experimental.SuperBuilder;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@ToString
public class User extends BaseModel {
    private String username;
    private String passwordHash;
    private String fullName;
    private LocalDate dateOfBirth;
    private String phone;
    private String email;
    private String address;
    @ToString.Exclude
    private Role role;
    private String specialization;
}