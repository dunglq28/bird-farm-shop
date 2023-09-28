/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Models.BirdDTO;
import java.util.List;

/**
 *
 * @author hj
 */
public class BirdDao {
    private List<BirdDTO> birdList;

    public List<BirdDTO> getBirdList() {
        return birdList;
    }
}
