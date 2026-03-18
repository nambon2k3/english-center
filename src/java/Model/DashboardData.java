/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Legion
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class DashboardData {
    private int numStudents;
    private int numTeachers;
    private int classes;
    private long revenue;
}
