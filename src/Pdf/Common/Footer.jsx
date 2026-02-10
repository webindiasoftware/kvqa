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

export const Footer = () => {
  return (
           <View style={styles.footer} fixed>
             <Text style={styles.footerText}>www.kvqa.in</Text>
           </View>
   
  )
}
