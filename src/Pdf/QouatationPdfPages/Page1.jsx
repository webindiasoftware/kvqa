import {
  Document,
  Page,
  Text,
  View,
  StyleSheet,
  Font,
  Image,
} from "@react-pdf/renderer";
import styles from "../styles";

export default function Page1() {
  return (
    <View style={{paddingBottom: 50}} wrap>   
        <View style={styles.metaContainer}>
                  <View style={styles.metaLeft}>
                    <View style={styles.metaRow}>
                      <Text style={styles.metaLabel}>Kind Attention</Text>
                      <Text style={styles.metaValue}>: Mr. Anupam Tarway</Text>
                    </View>
                    <View style={styles.metaRow}>
                      <Text style={styles.metaLabel}>Designation</Text>
                      <Text style={styles.metaValue} >: Director</Text>
                    </View>
                    <View style={styles.metaRow}>
                      <Text style={styles.metaLabel}>Bill To</Text>
                      <Text style={styles.metaValue} >: BBS Global Pvt. Ltd.</Text>
                    </View>
                    <View style={styles.metaRow}>
                      <Text style={styles.metaLabel}>Billing Address</Text>
                      <Text style={styles.metaValue}>
                        : 3, Dr. Rajendra Road, 
                        Unit-1A, Kolkata – 700020, West Bengal, India.
                      </Text>
                    </View>
                  </View>
        
                  <View style={styles.metaRight}>
                    <Text>Proposal Date : 24/05/2025</Text>
                    <Text>Proposal Number : KVQA/CERT/SA-14/05-25/0068</Text>
                    <Text>Client PAN Number : AAHCB7821N</Text>
                    <Text>Client GST Number : 19AAHCB7821N1Z5</Text>
                    <Text>Place of Supply : WEST BENGAL</Text>
                  </View>
                </View>
        
                {/* SUBJECT */}
                <Text style={styles.subject}>
                  Sub: Contract Proposal for SA8000:2014 Certification
                </Text>
        
                {/* BODY */}
                <View style={styles.body}>
                  <Text style={styles.paragraph}>
                     <Text style={{ fontWeight: "bold", marginBottom:8 }}>Dear Mr. Tarway,</Text>
                  </Text>
        
        <Text style={styles.paragraph}>
          We are pleased to send you this{" "}
          <Text style={{ fontWeight: "bold" }}>Offer</Text>{" "}
          for the{" "}
          <Text style={{ fontWeight: "bold" }}>Certification</Text>{" "}
          of your{" "}
          <Text style={{ fontWeight: "bold" }}>Management System</Text>{" "}
          in accordance with the{" "}
          <Text style={{ fontWeight: "bold" }}>SA8000:2014 Standard.</Text>{" "}
          Based on the information provided, we are pleased to transmit the{" "}
          <Text style={{ fontWeight: "bold" }}>Terms of Agreement</Text>{" "}
          which will govern business relations between{" "}
          <Text style={{ fontWeight: "bold" }}>
            KVQA Certification Services Pvt. Ltd.
          </Text>{" "}
          and your{" "}
          <Text style={{ fontWeight: "bold" }}>Company</Text>, should you choose to make
          use of our Services relevant to{" "}
          <Text style={{ fontWeight: "bold" }}>
            Management System Certification
          </Text>{" "}
          and the subsequent{" "}
          <Text style={{ fontWeight: "bold" }}>
            Maintenance of the Certificate
          </Text>{" "}
          applied at your{" "}
          <Text style={{ fontWeight: "bold" }}>Proposed Site/s</Text>.
        </Text>
        
        
        <Text style={styles.paragraph}>
          <Text style={{ fontWeight: "bold" }}>
            KVQA Certification Services Pvt. Ltd., a leading Provider of Assessment,
            Inspection, Certification and Training Services.
          </Text>{" "}
          KVQA Certification Services has developed{" "}
          <Text style={{ fontWeight: "bold" }}>
            Multi-Sector Expertise of Auditing
          </Text>{" "}
          backed by{" "}
          <Text style={{ fontWeight: "bold" }}>
            Qualified Auditors & Specialists
          </Text>{" "}
          with experience in diverse{" "}
          <Text style={{ fontWeight: "bold" }}>
            Industry Verticals.
          </Text>{" "}
          KVQA Certification Services covers a wide spectrum of{" "}
          <Text style={{ fontWeight: "bold" }}>
            Certification Scopes
          </Text>{" "}
          such as Paper, Printing & Publishing, Metals, Engineering, Export, Retailers,
          Construction, Computer Hardware & Software, Rubber & Plastics, Chemicals,
          Electrical & Electronics, Wood, Banking, Leather, Garments, Food, Education &
          many more.
        </Text>
        
        
        <Text style={styles.paragraph}>
          KVQA Certification Services Pvt. Ltd., is a{" "}
          <Text style={{ fontWeight: "bold" }}>
            Leader in the Certification Business
          </Text>{" "}
          serving approximately{" "}
          <Text style={{ fontWeight: "bold" }}>
            10,000 Valued and Satisfied Clients Worldwide
          </Text>{" "}
          conforming to different Scopes of Certification. Among the{" "}
          <Text style={{ fontWeight: "bold" }}>
            Range of Certifications, KVQA’s 
        Portfolio includes ISO 9001:2015 (Quality Management System), ISO 14001:2015 (Environmental Management 
        System), ISO 45001:2018 (Occupational Health & Safety Management System), ISO 22000:2018 (Food Safety 
        Management System/HACCP), ISO/IEC 27001:2022 (Information Security Management System), ISO 28000:2022 
        (Supply Chain Security Management System), SA8000:2014 (Social Accountability8000) and many other Industry 
        Nominations. 
          </Text>{" "}
        </Text>
        
        
                  <Text style={styles.sectionTitle}>SCOPE OF CERTIFICATION</Text>
                  <Text style={styles.paragraph}>
                    The following outline information was taken into account in accordance with the Application Form submitted while 
        creating your personalized offer:
                  </Text>
        
                  {/* TABLE */}
                  <View style={styles.table}>
                    <View style={styles.tableHeader}>
                      <Text style={[styles.th, styles.col1]}>
                        CERTIFICATION REQUIREMENTS
                      </Text>
                      <Text style={[styles.th, styles.col2]}>DESCRIPTION</Text>
                    </View>
        
                    <View style={styles.tr}>
                      <Text style={[styles.td, styles.col1]}>
                        Scope of Application
                      </Text>
                      <Text style={[styles.td, styles.col2]}>
                        MANUFACTURING OF LIGHT & HEAVY-DUTY WORKWEAR, GARMENTS, AND UNIFORMS 
        (RAW MATERIAL RECEIVE – CUTTING – EMBROIDERING - ASSEMBLING -STITCHING – 
        FINISHING – IRONING - CHECKING – PACKING – DISPATCH] 
                      </Text>
                    </View>
        
                    <View style={styles.tr}>
                      <Text style={[styles.td, styles.col1]}>No of Employees</Text>
                      <Text style={[styles.td, styles.col2]}>143</Text>
                    </View>
        
                    <View style={styles.tr}>
                      <Text style={[styles.td, styles.col1]}>No of Shifts</Text>
                      <Text style={[styles.td, styles.col2]}>1</Text>
                    </View>
        
                    <View style={styles.tr}>
                      <Text style={[styles.td, styles.col1]}>
                        Total Number of Sites
                      </Text>
                      <Text style={[styles.td, styles.col2]}>2</Text>
                    </View>
        
                    <View style={styles.tr}>
                      <Text style={[styles.td, styles.col1]}>
                        Audit Site Address Under Certification
                      </Text>
                      <Text style={[styles.td, styles.col2]}>HO: 3, Dr. Rajendra Road, Unit- 1A, Kolkata -700020, West Bengal, India. 
        Factory: Part of 1st floor (west side), 2nd and 3rd floor, D3 50/7/New,Shibtala Road-1, 
        Maheshtala, Ward-22, Maheshtala Municipality, Alipore, PS - Maheshtala,  PO - 
        Maheshtala S.O, South 24 Parganas, Pin - 700141, West Bengal, India. </Text>
                    </View>
        
                    <View style={styles.tr}>
                      <Text style={[styles.td, styles.col1]}>
                        Audit Language
                      </Text>
                      <Text style={[styles.td, styles.col2]}>
                        English, Hindi & Bengali
                      </Text>
                    </View>
        
                    <View style={styles.tr}>
                      <Text style={[styles.td, styles.col1]}>Accreditation</Text>
                      <Text style={[styles.td, styles.col2]}>SAAS</Text>
                    </View>
                  </View>
                </View>
        
    </View>
  )
}
