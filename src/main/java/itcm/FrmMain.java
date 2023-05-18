/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package itcm;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileFilter;
import javax.swing.filechooser.FileNameExtensionFilter;

/**
 *
 * @author rafae
 */
public class FrmMain extends javax.swing.JFrame {

    /**
     * Creates new form FrmMain
     */
    public FrmMain() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        txtInput = new javax.swing.JTextArea();
        btnAnalyze = new javax.swing.JButton();
        jScrollPane3 = new javax.swing.JScrollPane();
        txtLexResult = new javax.swing.JTextPane();
        jScrollPane4 = new javax.swing.JScrollPane();
        txtSyntaxResult = new javax.swing.JTextPane();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        jMenuItem1 = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        txtInput.setColumns(20);
        txtInput.setRows(5);
        jScrollPane1.setViewportView(txtInput);

        btnAnalyze.setFont(new java.awt.Font("Segoe UI", 0, 36)); // NOI18N
        btnAnalyze.setText("Analizar");
        btnAnalyze.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnalyzeActionPerformed(evt);
            }
        });

        txtLexResult.setEditable(false);
        txtLexResult.setContentType("text/html"); // NOI18N
        jScrollPane3.setViewportView(txtLexResult);

        txtSyntaxResult.setEditable(false);
        txtSyntaxResult.setContentType("text/html"); // NOI18N
        jScrollPane4.setViewportView(txtSyntaxResult);

        jMenu1.setText("File");

        jMenuItem1.setMnemonic('O');
        jMenuItem1.setText("Open File");
        jMenuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMenuOpenFileActionPerformed(evt);
            }
        });
        jMenu1.add(jMenuItem1);

        jMenuBar1.add(jMenu1);

        setJMenuBar(jMenuBar1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 194, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane3, javax.swing.GroupLayout.DEFAULT_SIZE, 200, Short.MAX_VALUE))
                    .addComponent(btnAnalyze, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jScrollPane4, javax.swing.GroupLayout.DEFAULT_SIZE, 400, Short.MAX_VALUE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(btnAnalyze)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 324, Short.MAX_VALUE)
                    .addComponent(jScrollPane3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnAnalyzeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnalyzeActionPerformed
        // La clase lexer necesita un fichero de entrada para analizarlo (el fichero contendra lo que ingrese
        // el usuario por la interfaz de usuario)
        // No es posible darle directamente el texto a la clase Lexer.java
        final String ARCHIVE_NAME = "input.txt";
        writeFile();
        try {
            readFile();
        } catch (IOException ex) {
            Logger.getLogger(FrmMain.class.getName()).log(Level.SEVERE, null, ex);
        }

    }//GEN-LAST:event_btnAnalyzeActionPerformed

    private void jMenuOpenFileActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMenuOpenFileActionPerformed
        JFileChooser fc = new JFileChooser();
        FileFilter filter = new FileNameExtensionFilter("FIF Source Code", "fif");
        fc.setFileFilter(filter);

        int selection = fc.showOpenDialog(null);
        if (selection == JFileChooser.APPROVE_OPTION) {
            txtInput.setText("");
            File file = fc.getSelectedFile();
            BufferedReader br;
            try {
                FileReader reader = new FileReader(file);
                br = new BufferedReader(reader);
                String line = br.readLine();

                while (line != null) {
                    txtInput.setText(txtInput.getText() + line + "\n");
                    line = br.readLine();
                }
            } catch (Exception e) {
                System.err.println("Error:" + e.getMessage());
            }
               btnAnalyze.doClick();
        }
    }//GEN-LAST:event_jMenuOpenFileActionPerformed

    private void writeFile() {
        PrintWriter writer;
        try {
            writer = new PrintWriter("input.txt");
            writer.print(txtInput.getText());
            writer.close();
        } catch (FileNotFoundException e) {
            System.out.println(e);
        }
    }

    private void readFile() throws IOException {

        FileReader lexicalReader = new FileReader("input.txt");
        FileReader parserReader = new FileReader("input.txt");

        LexerCup lexerCup = new LexerCup(parserReader);
        Lexer lexer = new Lexer(lexicalReader);

        lexicalParse(lexer);
        parse(lexerCup);
    }
    
    private void parse(LexerCup lexerCup) {
        Syntax s = new Syntax(lexerCup);
        StringBuilder result = new StringBuilder();
        try{
            s.parse();
            result.append("<h2 style='color: green;'>Análisis realizado correctamente!</h2>");
            txtSyntaxResult.setText(result.toString());
        }catch(Exception e) {
            // TODO: Fix the error tracking, e.g when it's a syntax error for a semicolon or any character at the last
            // TODO: of the line the parsers marks the error in the next linea instead of the actual line.
            // TODO: The parsers makrs -1 when detecs a syntax error in the last line or at the start of the first line
            e.printStackTrace();
            result.append("<h2 style='color: red';>Error de sintáxis en línea: ")
                    .append(s.getS().left)
                    .append(" Columna: ")
                    .append(s.getS().right + 1)
                    .append(" </h2>");
            txtSyntaxResult.setText(result.toString());
        }
    }

    private void lexicalParse(Lexer lexer) throws IOException {
        StringBuilder result = new StringBuilder();
        int previousLine = 0;

        // Este ciclo infinito analiza el fichero de input que se le pasa a clase Lexer.java
        // Concatena al text area de del JPanel lo que va identificando
        while (true) {
            Tokens tokens = lexer.yylex();
            if (tokens == null) {
                result.append("<p><strong>END</strong></p>");
                txtLexResult.setText(result.toString());
                break;
            }

            if (lexer.line != previousLine) {
                if (lexer.line != 1) {
                    result.append("<p></p>");
                }
                result.append("<h2>Linea ").
                        append(lexer.line).
                        append("</h2>").
                        append("\n");
            }

            if (tokens == Tokens.Error) {
                result.append("<p><span color='red'>").
                        append(lexer.name).
                        append("</span> - ").
                        append("Symbol not found</p>");
            } else {
                result.append("<p><span color='blue'>").
                        append(lexer.name).
                        append("</span>").
                        append(" - ").
                        append(tokens).
                        append(" \n");
            }
            previousLine = lexer.line;
        }
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(FrmMain.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FrmMain.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FrmMain.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FrmMain.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FrmMain().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAnalyze;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JTextArea txtInput;
    private javax.swing.JTextPane txtLexResult;
    private javax.swing.JTextPane txtSyntaxResult;
    // End of variables declaration//GEN-END:variables
}
