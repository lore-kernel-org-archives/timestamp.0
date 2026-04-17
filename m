Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2DE2BEC2B;
	Fri, 17 Apr 2026 21:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776461048; cv=none; b=sdOkKsSwRVpStB05aifcqY14pZcqkujxeXJf5CTccx9PHlvQEv2ruImkiOtgLwXmW7biWZrJ3A8/awjApZ8TXuZkBsBpL+hOyB890mSkOplOlnD5EuqnQWx+fsz8qzMNAlsady+FnyE/Jo9NYoznDflJzEpe9DVTzqrVFW+bBIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776461048; c=relaxed/simple;
	bh=B92JDhkABg6xAfZBWT76/qxIBUMfNsrSaDPOmk1wu3s=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SnJELi4Wd5Gdny7yBNhQ7MY/Zm8mVr11zKGs/phd+LP8ZG5xz3guz3bP8LwzAU5crjmkAV7P0BIWTYqhfnTqvxbhIJ3lA1rx6fbTIRXJ7ud+7QewZ3py7/uZJYzTyUTDl1t6/xeHVcDu4hNWyGHWMT/OIs7AAf9h97HmNMI6MvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxvMiQCv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxvMiQCv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DB3C19425;
	Fri, 17 Apr 2026 21:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776461048;
	bh=B92JDhkABg6xAfZBWT76/qxIBUMfNsrSaDPOmk1wu3s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CxvMiQCvJRF0tr3SpDGbaL4M1YzHswlPJGYuONtUDRKEuN4M1Cf6SsiLmO3JwtNXg
	 0V4SMZbfPFSMyK0YD5D2qJCzTj3oun7cymESFFSgkxE6acRqXvgmMoDmm6Fgfrqc0m
	 uhlKd+sUGJ3EkPKr/Np/85bJJdmlijZWfvfW+mhAGmtvxx9NbKUA2eaZa2cY/Cp5wK
	 b9hpuqtDwnuV8tsG16Z/1eLSOTFsi9DYMovwHv+8OPQ/rGXJ1vtEpkW1RS1vkedzYg
	 B89B1TpLF7HnkybaYb82rhWBQwfW/H5WqU0BX1rhoozgKMcldd5ZDGuAI14ic03nQ2
	 tKWDimv0VokrA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02EE4380CEE7;
	Fri, 17 Apr 2026 21:23:37 +0000 (UTC)
Subject: Re: [GIT PULL] hte: Changes for v7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260416180648.1498953-1-dipenp@nvidia.com>
References: <20260416180648.1498953-1-dipenp@nvidia.com>
X-PR-Tracked-List-Id: <timestamp.lists.linux.dev>
X-PR-Tracked-Message-Id: <20260416180648.1498953-1-dipenp@nvidia.com>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git tags/for-7.1-rc1
X-PR-Tracked-Commit-Id: 005b25ad11717139ca5c14c9f06c2a60855c2afd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 430cc9f42b44d174230f646767e1403699645ec5
Message-Id: <177646101568.161623.3670285195452884806.pr-tracker-bot@kernel.org>
Date: Fri, 17 Apr 2026 21:23:35 +0000
To: Dipen Patel <dipenp@nvidia.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, dipenp@nvidia.com, linux-kernel@vger.kernel.org, timestamp@lists.linux.dev, suneelg@nvidia.com, flavra@baylibre.com, marco.crivellari@suse.com, tj@kernel.org
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>

The pull request you sent on Thu, 16 Apr 2026 11:06:48 -0700:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/pateldipen1984/linux.git tags/for-7.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/430cc9f42b44d174230f646767e1403699645ec5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
