import { Font, StyleSheet } from "@react-pdf/renderer";

/* Optional: register fonts for better fidelity */
Font.register({
  family: "Helvetica",
  fonts: [
    {
      src: "https://fonts.gstatic.com/s/helvetica/v11/pxiEyp8kv8JHgFVrJJfedw.ttf",
      fontWeight: "normal",
      fontStyle: "normal",
    },
    {
      src: "https://fonts.gstatic.com/s/helvetica/v11/pxiByp8kv8JHgFVrLGT9Z1JlFQ.ttf",
      fontWeight: "bold",
      fontStyle: "normal",
    },
    {
      src: "https://fonts.gstatic.com/s/helvetica/v11/pxiDyp8kv8JHgFVrJJLmr19l.ttf",
      fontWeight: "normal",
      fontStyle: "italic",
    },
    {
      src: "https://fonts.gstatic.com/s/helvetica/v11/pxiGyp8kv8JHgFVrJJLedw.ttf",
      fontWeight: "bold",
      fontStyle: "italic",
    },
  ],
});


const RED = "#c4161c";

const styles = StyleSheet.create({
  page: {
    fontSize: 9,
    fontFamily: "Helvetica",
    // paddingBottom: 30,
    // marginHorizontal:10,
  },

    content: {
    marginHorizontal:10,
  },

  /* ================= HEADER ================= */
  header: {
    flexDirection: "row",
    padding: 4,
    alignItems: "flex-start",
    marginHorizontal:10,
  },
  headerLeft: {
   display:"flex",
   flexDirection:"column",
   width: 420,

  },
  headerLeftTop:{
  backgroundColor: RED,
    padding: 4,
  },
  headerTitle: {
    color: "#fff",
    fontSize: 16,
    // //fontFamily: "Helvetica-Bold",
    fontWeight:"bold",
  },
  headerSub: {
    color: "#fff",
    fontSize: 15,
    marginTop: 2,
  },
    headercenter: {
    width: 50,
    height: 44,
    alignItems: "flex-end",
    marginHorizontal:10,
    backgroundColor: RED,
    padding: 4,
  },

  headerRight: {
    width: 60,
    // height:,
    // border: "1 solid #064c58",
     alignItems: "flex-start",
    justifyContent: "start",
  },
  // logoBox: {
  //   // width: "100%",
  //   // height:"100%",
  //   border: "1 solid #e70707",

  // },
logoImage: {
 width: 100, height: 100
},


  /* ================= ADDRESS ================= */
  addressBlock: {
    // paddingHorizontal: 2,
    fontSize: 9,
    color:"#919191",
    padding:4
  },

  /* ================= META ================= */
  metaContainer: {
    flexDirection: "row",
    paddingHorizontal: 10,
    marginTop: 6,

    justifyContent:"space-between",
    marginRight:8
    // gap:8,
  },
  metaLeft: {
   width: 260,
  },
  metaRow: {
    flexDirection: "row",
    marginBottom: 3,
  },
  metaLabel: {
    width: 85,
    //fontFamily: "Helvetica-Bold",
    fontWeight:"bold",

  },
  metaValue: {
    flex: 1,
    marginLeft:2
  },
  metaColon:{
    marginRight:2,
  },
  metaRight: {
    width: 220,
    border: "1 solid #999",
    padding: 6,
    lineHeight:0.6,
    fontWeight:"bold",
    backgroundColor:"#cfcbcb"
  },

  /* ================= SUBJECT ================= */
  subject: {
    textAlign: "center",
    marginVertical: 8,
    //fontFamily: "Helvetica-Bold",
    textDecoration: "underline",
    fontSize: 12,
    fontStyle: "italic",
    fontWeight:"bold",
  },

  /* ================= BODY ================= */
  body: {
    paddingHorizontal: 10,
    // lineHeight:,
  },
  paragraph: {
  fontStyle: "italic",
  lineHeight: 0.9,
  marginBottom: 8,
  },

  /* ================= SECTION ================= */
  sectionTitle: {
    marginTop: 8,
    //fontFamily: "Helvetica-Bold",
    fontWeight:"bold",
    marginBottom:2
  },

  /* ================= TABLE ================= */
  table: {
    marginTop: 6,
    border: "1 solid #999",
    fontStyle: "italic",
  },
  tableHeader: {
    flexDirection: "row",
    backgroundColor: RED,
    textAlign:"center"
  },
  th: {
    color: "#fff",
    padding: 5,
    //fontFamily: "Helvetica-Bold",
    borderRight: "1 solid #fff",
    fontWeight:"bold",
    textAlign:"center"
  },
  col1: { width: "30%"  , fontWeight:"bold", },
  col2: { width: "70%" , textAlign:"center" , fontWeight:"bold", },

  tr: {
    flexDirection: "row",
    borderTop: "1 solid #999",
  },
  td: {
    padding: 5,
    borderRight: "1 solid #999",
  },

  /* ================= FOOTER ================= */
  footer: {
    position: "absolute",
    bottom: 0,
    left: 0,
    right: 0,
    backgroundColor: RED,
    textAlign: "center",
    padding: 6,
  },
  footerText: {
    color: "#fff",
    fontSize: 9,
  },
});

export default styles;