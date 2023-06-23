package fr.digiwin.module.EspaceEnseignant;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.TreeSet;

import com.jalios.jcms.Category;
import com.jalios.jcms.Channel;
import com.jalios.jcms.Member;
import com.jalios.jcms.Publication;
import com.jalios.util.Util;
import generated.Fiche;
import generated.FicheActionEducative;
import generated.FicheSiteExpo;

public class EspaceEnseignantHandler {
    
    private static final Channel channel = Channel.getChannel();

    public static HashSet<Category> getPeriodeParentCategory(Member loggedMember, Fiche fiche) {
        HashSet<Category> listPeriode = new HashSet<Category>();
        if (Util.notEmpty(fiche.getPeriode(loggedMember))) {  
            String catId = channel.getProperty("jcmsplugin.espaceEnseignant.periode.cat.root");
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

    public static Map<Category, Category> getPeriodeCategory(Member loggedMember, Fiche fiche) {
        Map<Category, Category> periodes = new HashMap<>();
        if (Util.notEmpty(fiche.getPeriode(loggedMember))) {  
            String catId = channel.getProperty("jcmsplugin.espaceEnseignant.periode.cat.root");
            if(Util.notEmpty(catId)) {
                // cherche période principale de la fiche
                Category catPeriode = channel.getCategory(catId); //cat de la catégorie période
                for(Category itCat : fiche.getPeriode(loggedMember)) { //liste des catégories de la fiche
                    boolean isParent = false;
                    Category catParent = itCat.getParent();
                    while(!isParent) {
                        if(Util.notEmpty(catParent.getParent()) && catParent.getParent().getId().equals(catPeriode.getId())) {
                            periodes.put(catParent, itCat);
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
        return periodes;
    }

    public static <T> ArrayList<Category> getFilAriane(Member loggedMember, T fiche) {
        ArrayList<Category> listFilAriane = new ArrayList<Category>();
        TreeSet<Category> treesetCat = null;
        String catId = null;
        if(fiche instanceof Fiche) {
            catId = channel.getProperty("jcmsplugin.espaceEnseignant.typologie.cat.root");
            treesetCat = ((Fiche) fiche).getTypologie(loggedMember);
        } else if(fiche instanceof FicheSiteExpo) {
            catId = channel.getProperty("jcmsplugin.espaceEnseignant.navigation.cat.root");
            treesetCat = ((FicheSiteExpo) fiche).getNavigation(loggedMember);
        } else if(fiche instanceof Fiche) { 
            catId = channel.getProperty("jcmsplugin.espaceEnseignant.navigation.cat.root");
            treesetCat = ((FicheActionEducative) fiche).getCategorieDeNavigation(loggedMember);
        } else { 
        	return null; 
        }
        
        if(catId != null && treesetCat != null) {
        	for(Category itCat : treesetCat) {
	            Category cat = itCat;
	             while(Util.notEmpty(cat.getParent()) && !cat.getId().equals(catId)  && !cat.isRoot()) {
	                listFilAriane.add(cat);
	                cat = cat.getParent();
	            }
	        }
            Collections.reverse(listFilAriane);
        }
        
        if(Util.notEmpty(listFilAriane) && channel.getProperty("display.navigate-root").equals(catId)) {
            listFilAriane.remove(0);
        }
        return listFilAriane;
    }

    public static boolean isCartelInfo(String userLang, Fiche fiche) {
    	return Util.notEmpty(fiche.getTitreCartel(userLang)) ||
    			Util.notEmpty(fiche.getNomDeLartiste(userLang)) ||
    			Util.notEmpty(fiche.getDateCartel(userLang)) ||
    			Util.notEmpty(fiche.getMatiere(userLang)) ||
    			Util.notEmpty(fiche.getDimension(userLang)) ||
    			Util.notEmpty(fiche.getLieu(userLang)) ||
    			Util.notEmpty(fiche.getLegs(userLang)) ||
    			Util.notEmpty(fiche.getNinventaire(userLang)) ||
    			Util.notEmpty(fiche.getCredits(userLang));
    }

    public static boolean isCartel(Member loggedMember, String userLang, Fiche fiche) {
    	return Util.notEmpty(fiche.getTitreCartel(userLang)) ||
    			Util.notEmpty(fiche.getNomDeLartiste(userLang)) ||
    			Util.notEmpty(fiche.getDateCartel(userLang)) ||
    			Util.notEmpty(fiche.getMatiere(userLang)) ||
    			Util.notEmpty(fiche.getDimension(userLang)) ||
    			Util.notEmpty(fiche.getLieu(userLang)) ||
    			Util.notEmpty(fiche.getLegs(userLang)) ||
    			Util.notEmpty(fiche.getNinventaire(userLang)) ||
    			Util.notEmpty(fiche.getCredits(userLang)) ||
    			Util.notEmpty(fiche.getNomDeLartiste(userLang)) ||
    			Util.notEmpty(fiche.getTypologie(loggedMember)) ||
    			Util.notEmpty(fiche.getPeriode(loggedMember));
    }


    public static Map<Category, Category> getThemeCategory(Member loggedMember, FicheActionEducative fiche) {
        Map<Category, Category> periodes = new HashMap<>();
        if (Util.notEmpty(fiche.getTheme(loggedMember))) {  
            String catId = channel.getProperty("jcmsplugin.espaceEnseignant.periode.cat.root");
            if(Util.notEmpty(catId)) {
                // cherche période principale de la fiche
                Category catPeriode = channel.getCategory(catId); //cat de la catégorie période
                for(Category itCat : fiche.getTheme(loggedMember)) { //liste des catégories de la fiche
                    boolean isParent = false;
                    Category catParent = itCat.getParent();
                    while(!isParent) {
                        if(Util.notEmpty(catParent.getParent()) && catParent.getParent().getId().equals(catPeriode.getId())) {
                            periodes.put(catParent, itCat);
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
        return periodes;
    }
}
