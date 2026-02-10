import {
  Document,
  Page,
  Text,
  View,
  StyleSheet,
  Font,
  Image,
} from "@react-pdf/renderer";
import logo from "../../assets/logo.png"
import styles from "../styles";

export const Header = () => {
  return (
            
            <View style={styles.header} fixed>
              <View style={styles.headerLeft}>
               <View style={styles.headerLeftTop}>
                 <Text style={styles.headerTitle}>
                  KVQA CERTIFICATION SERVICES PRIVATE LIMITED
                </Text>
                <Text style={styles.headerSub}>Contract Proposal</Text>
               </View>
    
              <View style={styles.addressBlock}>
              <Text>
                Registered Office: Third Floor, I-25, Maharani Bagh, New Delhi – 110065, India
              </Text>
              <Text>
                Corporate Office: F-300, Sector 63 Noida – 201301, U.P., India
              </Text>
              <Text>
                Phone: +91 98912 95551, Email: social@kvqaindia.com
              </Text>
            </View>
              </View>
              <View style={styles.headercenter}>
              </View>
              <View style={styles.headerRight}>
                 <Image
        src={logo}
         style={{
              width: 60,
              height: 60,
              objectFit: "contain",
            }}
      />
              </View>
            </View>
    
  )
}
