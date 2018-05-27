import { Socket } from "phoenix"

let socket = new Socket("/socket", { params: { token: window.userToken } })

socket.connect()

const createSocket = (topicId) => {
  let channel = socket.channel(`comments:${topicId}`, {})
  channel.join()
    .receive("ok", resp => {
      renderComments(resp.comments);
      console.log(resp);
    })
    .receive("error", resp => { console.log("Unable to join", resp) });

  channel.on(`comments:${topicId}:new`, renderComment)


  document.querySelector('button').addEventListener('click', () => {
    const content = document.querySelector('textarea').value;

    channel.push('comment:add', { content: content })
  })
}

const renderComment = ({comment}) => {
  const renderedComment = renderCommentTemplate(comment);

  document.querySelector('.collection').innerHTML += renderedComment;
}

const renderComments = (comments) => {
  const renderedComments = comments.map(comment => {
    return renderCommentTemplate(comment)
  });

  document.querySelector('.collection').innerHTML = renderedComments.join(' ');
}
const renderCommentTemplate = (comment) => {
  return `
  <li class="collection-item">
    ${comment.content}
  </li>
`;
}

window.createSocket = createSocket;