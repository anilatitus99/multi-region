const { Firestore } = require('@google-cloud/firestore');
const firestore = new Firestore();

async function queryTest() {
  const docRef = firestore.collection('testCollection').doc('testDoc');
  const doc = await docRef.get();

  if (!doc.exists) {
    console.log('No such document!');
  } else {
    console.log('Document data:', doc.data());
  }
}

queryTest().catch(console.error);
