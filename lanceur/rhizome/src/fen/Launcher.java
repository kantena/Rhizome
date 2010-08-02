/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * Launcher.java
 *
 * Created on 28 juil. 2010, 11:46:11
 */

package fen;

/**
 *
 * @author kantena
 */
public class Launcher extends javax.swing.JFrame {

    /** Creates new form Launcher */
    public Launcher() {
        initComponents();
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        liste_modules_actifs = new javax.swing.JList();
        menu = new javax.swing.JMenuBar();
        menu_demarrer = new javax.swing.JMenu();
        item_demarrer_quitter = new javax.swing.JMenuItem();
        menu_modules = new javax.swing.JMenu();
        item_modules_liste_modules = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Rhizome");
        setName("rhizome_frame"); // NOI18N

        liste_modules_actifs.setModel(new javax.swing.AbstractListModel() {
            String[] strings = { "Item 1", "Item 2", "Item 3", "Item 4", "Item 5" };
            public int getSize() { return strings.length; }
            public Object getElementAt(int i) { return strings[i]; }
        });
        jScrollPane1.setViewportView(liste_modules_actifs);

        menu_demarrer.setText("Démarrer");

        item_demarrer_quitter.setText("Quitter");
        menu_demarrer.add(item_demarrer_quitter);

        menu.add(menu_demarrer);

        menu_modules.setText("Modules");

        item_modules_liste_modules.setText("Liste des modules");
        menu_modules.add(item_modules_liste_modules);

        menu.add(menu_modules);

        setJMenuBar(menu);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 417, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 275, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
    * @param args the command line arguments
    */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Launcher().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JMenuItem item_demarrer_quitter;
    public javax.swing.JMenuItem item_modules_liste_modules;
    public javax.swing.JScrollPane jScrollPane1;
    public javax.swing.JList liste_modules_actifs;
    public javax.swing.JMenuBar menu;
    public javax.swing.JMenu menu_demarrer;
    public javax.swing.JMenu menu_modules;
    // End of variables declaration//GEN-END:variables

}