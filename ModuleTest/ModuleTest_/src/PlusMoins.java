
import java.awt.event.ActionListener;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * PlusMoins.java
 *
 * Created on 18 août 2010, 16:08:21
 */

/**
 *
 * @author kantena
 */
public class PlusMoins extends javax.swing.JFrame implements ActionListener {

    /** Creates new form PlusMoins */
    public PlusMoins() {
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

        txt_message = new javax.swing.JTextField();
        btn_plus2 = new javax.swing.JToggleButton();
        btn_moins3 = new javax.swing.JToggleButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        txt_message.setFont(new java.awt.Font("Kinnari", 2, 24)); // NOI18N
        txt_message.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        txt_message.setText("0");
        txt_message.addActionListener(this);

        btn_plus2.setText("Plus 2");

        btn_moins3.setText("Moins 3");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(txt_message, javax.swing.GroupLayout.DEFAULT_SIZE, 593, Short.MAX_VALUE)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(btn_plus2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 482, Short.MAX_VALUE)
                .addComponent(btn_moins3))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(txt_message, javax.swing.GroupLayout.PREFERRED_SIZE, 59, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btn_moins3)
                    .addComponent(btn_plus2))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }

    // Code for dispatching events from components to event handlers.

    public void actionPerformed(java.awt.event.ActionEvent evt) {
        if (evt.getSource() == txt_message) {
            PlusMoins.this.txt_messageActionPerformed(evt);
        }
    }// </editor-fold>//GEN-END:initComponents

    private void txt_messageActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_messageActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_messageActionPerformed

    /**
    * @param args the command line arguments
    */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new PlusMoins().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JToggleButton btn_moins3;
    public javax.swing.JToggleButton btn_plus2;
    public javax.swing.JTextField txt_message;
    // End of variables declaration//GEN-END:variables

}