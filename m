Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D17BE40
	for <timestamp@lists.linux.dev>; Wed,  3 May 2023 18:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27832C4339B;
	Wed,  3 May 2023 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683138742;
	bh=KkRexol8rqSfFiweVA984O6MeZg980x3q8wOoY3/CMI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=a6Pb9wRMrhsTG1yoMAXnc0iQxk3nPgD2eYQIdXHVkEEO17GZCpLq74+o1w38KO6Z3
	 vR8R6SqBQOoqLs9SAYlysbIb4yO1UqTtzxazwAqg6XoOV41WszcObBBXZlOBwvgXH4
	 T1oLKNt/PHFKuWo7QjQ1uvHSPAucMDqwIhIlHVqAgadSZ3eLOMGxgGBfDzqNJLMPBR
	 GkR+wAzS/SPk1j8ZcX9+UbYNVfPDBMxr0XUBnVXe1oXokwiXYZxbT95I99mWGpjwDk
	 ZGoKsZH4/E4fMrI3HlMsXGk55+Boq0b4ucYUzGqzS0woUGn/lg+H2omqPz7BEXDHx6
	 ISO4ElFT9uVTw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1714DE5FFC9;
	Wed,  3 May 2023 18:32:22 +0000 (UTC)
Subject: Re: [GIT PULL] hte: Changes for v6.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230503032947.23384-1-dipenp@nvidia.com>
References: <20230503032947.23384-1-dipenp@nvidia.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230503032947.23384-1-dipenp@nvidia.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git tags/for-6.4-rc1
X-PR-Tracked-Commit-Id: ca3d1a4b419acad3fca6828884acb03614f7558b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 29ee463d6fe45adde02098b3aa1166cd65fd2739
Message-Id: <168313874209.23026.3621881726709996863.pr-tracker-bot@kernel.org>
Date: Wed, 03 May 2023 18:32:22 +0000
To: Dipen Patel <dipenp@nvidia.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Dipen Patel <dipenp@nvidia.com>, timestamp@lists.linux.dev, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 2 May 2023 20:29:47 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git tags/for-6.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/29ee463d6fe45adde02098b3aa1166cd65fd2739

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
