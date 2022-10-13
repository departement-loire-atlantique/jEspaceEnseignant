package fr.digiwin.module.EspaceEnseignant;

import java.util.ArrayList;
import com.jalios.jcms.Category;
import com.jalios.jcms.Channel;
import com.jalios.jcms.Member;
import com.jalios.util.Util;
import generated.Fiche;

public class EspaceEnseignantHandler {
    
    private static final Channel channel = Channel.getChannel();

    public static ArrayList<Category> getPeriodeParentCategory(Member loggedMember, Fiche fiche) {
        ArrayList<Category> listPeriode = new ArrayList<Category>();
        if (Util.notEmpty(fiche.getPeriode(loggedMember))) {  
            String catId = channel.getProperty("jcmsplugin.espaceEnseignant.espace.cat.root");
            if(Util.notEmpty(catId)) {
                // cherche période principale de la fiche
                Category catPeriode = channel.getCategory(catId); //cat de la catégorie période
                for(Category itCat : fiche.getPeriode(loggedMember)) { //liste des catégories de la fiche
                    boolean isParent = false;
                    Category catParent = itCat.getParent();
                    while(!isParent) {
                        if(Util.notEmpty(catParent.getParent()) && catParent.getParent().getId().equals(catPeriode.getId())) {
                            listPeriode.add(catParent); //ajoute la période à la liste
                            isParent = true; //fin on trouve le parent
                        } else {
                            if(Util.notEmpty(catParent.getParent())) {
                                catParent = catParent.getParent(); //prochain parent
                            } else {
                                isParent = true; //sinon fin
                            }
                        }
                    }
                }
            }
        }
        return listPeriode;
    }
}
