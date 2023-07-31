<script>
	import { createClient } from '@nhost/js-sdk';

	const nhost = createClient({
		baseURL: 'https://hasura-storage.admin.servicehost.io'
	});

	let fileInput;

	const uploadFile = async () => {
		if (!fileInput.files[0]) return;
		const response = await nhost.storage.upload({
			file: fileInput.files[0]
		});
		console.log(response);
	};
</script>

<input type="file" bind:this={fileInput} />
<button on:click={uploadFile}>Upload</button>