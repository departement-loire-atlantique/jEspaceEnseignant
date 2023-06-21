package fr.digiwin.module.EspaceEnseignant.exportZip;

import java.io.*;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;

import com.jalios.jcms.Channel;
import com.jalios.jcms.FileDocument;
import com.jalios.jcms.JcmsUtil;
import com.jalios.jcms.Publication;
import com.jalios.jcms.servlet.BinaryFileServlet.DownloadTicket;
import com.jalios.util.Util;

import generated.CarouselElement;
import generated.Fiche;

public class ExportZip {
  
  private static final Logger LOGGER = Logger.getLogger(ExportZip.class);
  public static final String FILENAME = "exportRessources.zip";
  private static final String rootPath = Channel.getChannel().getWebappPath();


	private List<File> listImage(CarouselElement[] galerieVisuel) {
		List<File> listFile = new ArrayList<File>();
		for (CarouselElement element : galerieVisuel) {
//			File newFile = new File("jcms\\" + element.getImage()); // hmm
      File newFile = new File(element.getImage()); // hmm
		  listFile.add(newFile);
		}
		return listFile;
	}

	public DownloadTicket exportZip(CarouselElement[] galerieVisuel, String filename) {
		String newFilename = filename.replace(" ", "_");
		List<File> files = listImage(galerieVisuel);
		DownloadTicket ticket = null;

		try {
			// Zip content into a temp file
			File tempFile = File.createTempFile("JcmsPluginPopExplorerZipDownload.", ".zip");
			// zos is final !!
			try (final ZipOutputStream zos = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(tempFile)))) {

				byte[] buf = new byte[1024];
				for (int i = 0; i < files.size(); i++) {    
					FileInputStream in = new FileInputStream(rootPath + files.get(i).getPath());
					// add ZIP entry to output stream
					zos.putNextEntry(new ZipEntry(files.get(i).getName()));
					// transfer bytes from the file to the ZIP file
					int len;
					while ((len = in.read(buf)) > 0) {
						zos.write(buf, 0, len);
					}
					// complete the entry
					zos.closeEntry();
					in.close();
				}

				// ZIP build
				String zipName = newFilename + "_Images.zip";
				ticket = new DownloadTicket(tempFile, "application/zip", zipName);
				ticket.setDeleteFileAfterDelivery(true);
				ticket.setUsePragmaNoCache(true);
				// ticket.sendToDownloadUrl(request, response);

			} catch (IOException e) {
				System.out.println("ioexception1");
			}
		} catch (IOException e) {
			System.out.println("ioexception2");
		}
		return ticket;
	}
	
	/**
	 * Exportation de "documentTelechargeable" du type Fiche 
	 * @param publicationsSet
	 * @return
	 */
	 public DownloadTicket exportPublicationsZip(Set<Publication> publicationsSet) {
	    DownloadTicket ticket = null;

	    try {
	      // Zip content into a temp file
	      File tempFile = File.createTempFile("JcmsPluginPopExplorerZipDownload.", ".zip");
	      // zos is final !!
	      try (final ZipOutputStream zos = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(tempFile)))) {

	        byte[] buffer = new byte[1024];
	        
	        for (Publication itPub : publicationsSet) {
	          
	          if (itPub instanceof Fiche) {
	            Fiche fiche = (Fiche)itPub;
	          
  	          try {
  	            // On récupère le fichier à ajouter
  	            File itFile = null;
  	            
  	            FileDocument ressourceFileDocument = (FileDocument) itPub.getFieldValue("documentTelechargeableFile");

                if (Util.notEmpty(ressourceFileDocument)) {
                    itFile = new File(rootPath + ressourceFileDocument.getFilename());
                } else {
                    String ressourcePath = (String) itPub.getFieldValue("documentTelechargeable");
                    
                    if (Util.isValidUrl(ressourcePath)) {

                        URL url = new URL(ressourcePath);
                        
                        itFile = File.createTempFile(FilenameUtils.getBaseName(ressourcePath), "." + FilenameUtils.getExtension(ressourcePath));
                        
                        FileUtils.copyURLToFile(url, itFile);
                    }
  	            }

                if (Util.isEmpty(itFile) || !itFile.exists()) {
                    continue;
                }
  	            
  	            // On va ajouter les données du fichier au ZIP
  	            FileInputStream fis = new FileInputStream(itFile);
  	            
  	            zos.putNextEntry(new ZipEntry(itFile.getName()));
  	            
  	            int length;
  	            
  	            // On écrit les données dans le zip
  	            while ((length = fis.read(buffer)) > 0) {
  	              zos.write(buffer, 0, length);
  	            }
  
  	            // Fermeture des streams qui ne servent plus
  	            zos.closeEntry();
  	            fis.close();
  	            
  	          } catch (Exception e) {
  	            LOGGER.warn("Erreur lors d'un import de ressources dans le ZIP d'export " + fiche + " : " + e.getMessage());
  	          }
  	        }
	        }

	        // ZIP build
	        String zipName = FILENAME;
	        ticket = new DownloadTicket(tempFile, "application/zip", zipName);
	        ticket.setDeleteFileAfterDelivery(true);
	        ticket.setUsePragmaNoCache(true);

	      } catch (IOException e) {
	        System.out.println("ioexception1");
	      }
	    } catch (IOException e) {
	      System.out.println("ioexception2");
	    }
	    return ticket;
	  }
}