/*
 * Copyright (c) 2000 Apple Computer, Inc. All rights reserved.
 *
 * @APPLE_LICENSE_HEADER_START@
 * 
 * The contents of this file constitute Original Code as defined in and
 * are subject to the Apple Public Source License Version 1.1 (the
 * "License").  You may not use this file except in compliance with the
 * License.  Please obtain a copy of the License at
 * http://www.apple.com/publicsource and read it before using this file.
 * 
 * This Original Code and all software distributed under the License are
 * distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, EITHER
 * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
 * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE OR NON-INFRINGEMENT.  Please see the
 * License for the specific language governing rights and limitations
 * under the License.
 * 
 * @APPLE_LICENSE_HEADER_END@
 */
/*
 * @OSF_COPYRIGHT@
 */
/*
 *	Definitions for RPC subsystems.
 */

#ifndef	_IPC_IPC_SUBSYSTEM_H_
#define _IPC_IPC_SUBSYSTEM_H_

#include <mach/kern_return.h>
#include <mach/mach_types.h>
#include <mach/std_types.h>
#include <mach/rpc.h>

#ifdef MACH_KERNEL_PRIVATE
#include <kern/kern_types.h>
#include <kern/lock.h>

#define subsystem_lock_init(subsys) \
	simple_lock_init(&(subsys)->lock, ETAP_MISC_RPC_SUBSYS)
#define subsystem_lock(subsys)		simple_lock(&(subsys)->lock)
#define subsystem_unlock(subsys)	simple_unlock(&(subsys)->lock)

/*
 *	A subsystem describes a set of server routines that can be invoked by
 *	mach_rpc() on the ports that are registered with the subsystem.
 *	See struct rpc_subsystem in mach/rpc.h, for more details.
 */
struct subsystem {
	/* Synchronization/destruction information */
	decl_simple_lock_data(,lock)	/* Subsystem lock		     */
	int		ref_count;	/* Number of references to me	     */
	vm_size_t	size;		/* Number of bytes in this structure */
					/* including the variable length     */
					/* user_susbystem description	     */
        /* Task information */
        task_t          task;           /* Task to which I belong	     */
        queue_chain_t   subsystem_list; /* list of subsystems in task	     */

	/* IPC stuff: */
	struct ipc_port *ipc_self;	/* Port naming this subsystem	     */

	struct rpc_subsystem user;	/* MIG-generated subsystem descr     */
};

extern void		subsystem_init(void);

#endif /* MACH_KERNEL_PRIVATE */

#if	MACH_KDB
extern void		subsystem_print(
				subsystem_t	subsystem);
#endif	/* MACH_KDB */

#endif	/* _IPC_IPC_SUBSYSTEM_H_ */

#ifndef __SUBSYSTEM_H__
#define __SUBSYSTEM_H__

#include <sys/stat.h>

__BEGIN_DECLS
/*
* Returns an fd for the given path, relative to root or to
* the subsystem root for the process.  Behaves exactly like
* open in every way, except O_CREAT is forbidden.
*
* Returns a file descriptor on success, or -1 on failure.
* errno is set exactly as open would have set it, except
* that O_CREAT will result in EINVAL.
*/
int open_with_subsystem(const char * path, int oflag);

/*
* Invokes stat for the given path, relative to root or to
* the subsystem root for the process.  Behaves exactly like
* stat in every way.
*
* Returns 0 on success, or -1 on failure.  On failure, errno
* is set exactly as stat would have set it.
*/
int stat_with_subsystem(const char *__restrict path, struct stat *__restrict buf);
__END_DECLS

#endif /* __SUBSYSTEM_H__ */